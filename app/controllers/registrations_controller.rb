class RegistrationsController < ApplicationController
  before_action :set_run, only: [:register, :unregister]

  # POST /registrations
  def register
    confirmed = @run.registrations_booked < @run.registration_limit
    @registration = Registration.new(run_id: @run_id, user_id: current_user.id, confirmed: confirmed)

    if @registration.save
      update_registrations_booked 1
      redirect_to runs_path, notice: 'Registration was successfully created.'
    else
      redirect_to runs_path, notice: 'Registration was not successfully created.'
    end
  end

  # DELETE /registrations/1
  def unregister
    place_will_free = @run.registrations_booked == @run.registration_limit

    @registration = Registration.find_by_run_id_and_user_id(@run_id, current_user.id)
    @registration.destroy

    if place_will_free
      bump_first_user_on_waiting_list
    else
      update_registrations_booked -1
    end

    redirect_to runs_path, notice: 'Registration was successfully destroyed.'
  end

  private

  def update_registrations_booked(delta)
    @run.registrations_booked = @run.registrations_booked || 0
    @run.registrations_booked += delta
    @run.registrations_booked = @run.registrations_booked.negative? ? 0 : @run.registrations_booked
    @run.save
  end

  def bump_first_user_on_waiting_list
    first_user_on_waiting_list = Registration.where('confirmed = false').order('created_at DESC').first
    first_user_on_waiting_list.confirmed = true
    first_user_on_waiting_list.save
    WaitingListMailer.with(user: current_user, run: @run).notification_email.deliver_later
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run_id = params['run_id']
    @run = Run.find_by_id(@run_id)
  end
end

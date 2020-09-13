class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:destroy]

  # POST /registrations
  # POST /registrations.json
  def register
    run_id = params['run_id']
    run = Run.find_by_id(run_id)
    confirmed = run.registrations_booked < run.registration_limit
    @registration = Registration.new(run_id: run_id, user_id: current_user.id, confirmed: confirmed)

    respond_to do |format|
      if @registration.save
        run.registrations_booked = run.registrations_booked ? run.registrations_booked + 1 : 1
        run.save
        format.html { redirect_to runs_path, notice: 'Registration was successfully created.' }
        format.json { render :runs, status: :created, location: @registration }
      else
        format.html { redirect_to runs_path, notice: 'Registration was not successfully created.' }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def unregister
    run_id = params['run_id']
    run = Run.find_by_id(run_id)
    place_will_free = run.registrations_booked == run.registration_limit

    @registration = Registration.find_by_run_id_and_user_id(run_id, current_user.id)
    @registration.destroy

    if place_will_free
      first_user_on_waiting_list = Registration.where("confirmed = false").order("created_at DESC").find(1)
      first_user_on_waiting_list.confirmed = true
      first_user_on_waiting_list.save
      # TODO: Send notification email
    else
      run.registrations_booked = run.registrations_booked && run.registrations_booked > 0 ?
                                     run.registrations_booked - 1 : 0
      run.save
    end

    respond_to do |format|
      format.html { redirect_to runs_path, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_registration
    @registration = Registration.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def registration_params
    params.permit(:run_id)
  end
end

class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:destroy]

  # POST /registrations
  # POST /registrations.json
  def register
    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
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
    @registration.destroy
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

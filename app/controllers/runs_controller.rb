class RunsController < ApplicationController
  before_action :set_run, only: []

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def run_params
    params.require(:run).permit(:starting_at, :registration_limit, :registrations_booked)
  end
end

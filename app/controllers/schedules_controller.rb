class SchedulesController < ApplicationController
  def index
    render json: Schedule.all.as_json
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:send_at, :email_id))
    if @schedule.save
      render json: @schedule.as_json
    else
      render json: @schedule.errors.to_json, status: 403
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render json: {}
  end
end

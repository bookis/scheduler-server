class SchedulesController < ApplicationController
  def index
    @email = Email.find(params[:email_id])
    render json: @email.schedules.as_json
  end

  def create
    @email = Email.find(params[:email_id])
    @time = @email.schedules.maximum(:send_at)
    @scheduler = Scheduler.new(@email, after: @time)
    begin
      @email.schedules.create!(@scheduler.schedules)
      render nothing: true, status: 201
    rescue ActiveRecord::RecordInvalid => e
      render json: {error: e.message}, status: 400
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render json: {}
  end
end

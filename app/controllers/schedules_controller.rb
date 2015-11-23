class SchedulesController < ApplicationController
  def index
    render json: Schedule.all.as_json
  end

  def create
    @email = Email.find(params[:email_id])
    @scheduler = Scheduler.new(@email)
    @email.schedules.create!(@scheduler.schedules)
    render nothing: true, status: 201
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    render json: {}
  end
end

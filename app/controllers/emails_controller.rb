class EmailsController < ApplicationController
  def index
    render json: current_user.emails.all.as_json
  end

  def create
    email_params = params.require(:email).permit(:subject, :to, :body, :every_n_minutes, :times, :send_first_at)
    @email = current_user.emails.new(email_params)
    if @email.save
      render json: @email.as_json
    else
      render json: @email.errors.to_json, status: 403
    end
  end

  def destroy
    @email = current_user.emails.find(params[:id])
    @email.destroy
    render json: {}
  end
end

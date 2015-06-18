class EmailsController < ApplicationController
  def index
    render json: current_user.emails.all.as_json
  end

  def create
    @email = current_user.emails.new(params.require(:email).permit(:subject, :to, :body))
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

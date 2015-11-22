class ApplicationController < ActionController::API

  before_filter :determine_redirect_to

  rescue_from ActiveRecord::RecordNotFound do
    render json: {error: "Not Found"}, status: 404
  end

  def determine_redirect_to
    session[:redirect_to] = params[:redirect_to] if params[:redirect_to]
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end
end

class UsersController < ApplicationController
  def show
    render json: current_user.to_json(only: [:id, :email])
  end
end

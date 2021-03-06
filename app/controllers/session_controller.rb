class SessionController < ApplicationController

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.find_or_initialize_by(uid: auth_hash.uid)
    user.email            = auth_hash.info.email
    user.token_expires_at = Time.at(auth_hash.credentials.expires_at.to_i)
    user.token            = auth_hash.credentials.token
    user.refresh_token    = auth_hash.credentials.refresh_token
    if user.save
      session[:user_id] = user.id
      redirect_to session.delete :redirect_to
    else
      render nothing: true, status: 404
    end
  end

  def destroy
    reset_session
    render nothing: true, status: 202
  end

  def new
    redirect_to "/auth/google_oauth2"
  end

  def redirect_if_specified
    redirect_to session[:redirect_to]
  end
end

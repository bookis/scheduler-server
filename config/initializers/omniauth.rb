Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    scope: 'https://mail.google.com/,https://www.googleapis.com/auth/userinfo.email',
    access_type: :offline,
    prompt: :consent
end

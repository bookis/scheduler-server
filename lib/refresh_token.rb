class RefreshToken
  class RefreshError < StandardError;end
  attr_accessor :token, :token_expires_at

  include HTTParty
  base_uri 'https://accounts.google.com'

  def initialize(attrs={})
    @refresh_token = attrs[:refresh_token]
  end

  def refresh!
    if response.code == 200
      @token = parsed_response['access_token']
      @token_expires_at   = DateTime.now + parsed_response['expires_in'].seconds
    else
      raise RefreshError, "The access token could not be refreshed"
    end
    self
  end

  def parsed_response
    response.parsed_response
  end

  def response
    @get_access_token ||= self.class.post("/o/oauth2/token", options)
  end

  def options
    {
      body: {
        client_id: ENV["GOOGLE_CLIENT_ID"],
        client_secret: ENV["GOOGLE_CLIENT_SECRET"],
        refresh_token: @refresh_token,
        grant_type: 'refresh_token'
      },
      headers: {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    }
  end

  def to_h
    {
      token: token,
      token_expires_at: token_expires_at
    }
  end
end

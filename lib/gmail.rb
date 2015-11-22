class Gmail
  attr_accessor :from, :to, :subject, :body
  attr_writer :token

  def initialize(attrs={})
    @from    = attrs[:from]
    @to      = attrs[:to]
    @subject = attrs[:subject]
    @body    = attrs[:body]
    @token   = attrs[:token]
  end

  def to_h
    {
      to: @to,
      from: @from,
      subject: @subject,
      html_body: @body,
      via: :smtp,
      via_options: smtp_options
    }
  end

  def smtp_options
    {
      address: 'smtp.gmail.com',
      port: '587',
      user_name: @from,
      password: @token,
      authentication: :xoauth2,
      enable_starttls_auto: true
    }
  end


end

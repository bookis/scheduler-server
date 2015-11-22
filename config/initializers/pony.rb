Pony.options = {
  :via => :smtp,
  :via_options => {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :user_name      => ENV["EMAIL_USER_NAME"],
    :password       => ENV["EMAIL_PASSWORD"],
    :authentication => :xoauth2,
    :enable_starttls_auto => true
  }
}

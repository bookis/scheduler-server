class Email < ActiveRecord::Base
  validates :to, :subject, :times, :send_first_at, presence: true
  validates :every_n_minutes, numericality: {minimum: 60 * 24}
end

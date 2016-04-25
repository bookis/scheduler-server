class Schedule < ActiveRecord::Base
  belongs_to :email
  validates :email_id, presence: true
  validates :send_at, presence: {message: "must be a valid date"}, uniqueness: {message: "has already been scheduled", scope: :email_id}
end

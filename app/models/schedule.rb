class Schedule < ActiveRecord::Base
  validates :email_id, presence: true
  validates :send_at, format: {with: /\d{2,4}-\d{1,2}-\d{1,2}/, message: "must be yy-mm-dd", allow_nil: false}
end

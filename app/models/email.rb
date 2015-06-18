class Email < ActiveRecord::Base
  validates :to, :subject, presence: true
end

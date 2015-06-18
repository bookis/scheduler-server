class User < ActiveRecord::Base
  has_many :emails
  validates :email, :token, presence: true, uniqueness: true
end

class Account < ActiveRecord::Base
  message = "Only alphanumeric characters and underscores accepted"
  validates :username, presence: true, uniqueness: true, length: {maximum: 15},
  format: { with: /\A[A-Za-z0-9\_]/, message: message }
  validates :category, presence: true
end

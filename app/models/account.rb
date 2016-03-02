class Account < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates_format_of :username, with: /\A[A-Za-z0-9\_]/
end

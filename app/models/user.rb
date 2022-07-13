class User < ApplicationRecord
  # add one to many association for user-messages
  has_many :messages, dependent: :destroy
  
  # constraint for usename length and uniqueness
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 15 }
  
  # add secure option to user password
  has_secure_password
end
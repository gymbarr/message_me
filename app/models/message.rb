class Message < ApplicationRecord
  # add one to many association for user-messages
  belongs_to :user

  # constraint for message body length
  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
end
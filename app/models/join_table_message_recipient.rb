class JoinTableMessageRecipient < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :private_message
  validates :private_message_id,
  presence: true
  validates :recipient_id,
  presence: true
end

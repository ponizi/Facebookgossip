require 'bcrypt'

class User < ApplicationRecord
  belongs_to :city, optional: true 
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
  has_many :comments
  has_many :likes
  validates :first_name,
  presence: true
  validates :last_name,
  presence: true
  validates :email,
  presence: true
  has_secure_password
  validates :password,
  presence: true
  validates :email,
  presence: true
end

class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :join_table_gossips_tags
  has_many :tags, through: :join_table_gossips_tags
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  validates :title,
  presence: true,
  length: { in: 3..25 }
  validates :content,
  presence: true
end
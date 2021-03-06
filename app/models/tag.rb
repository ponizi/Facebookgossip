class Tag < ApplicationRecord
  has_many :join_table_gossips_tags
  has_many :gossips, through: :join_table_gossips_tags
  validates :title,
  presence: true,
  length: { in: 3..14 }
end

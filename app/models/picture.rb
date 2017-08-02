class Picture < ApplicationRecord
  belongs_to :user
  has_many :picture_tags, inverse_of: :picture
  has_many :tags, through: :picture_tags
  has_many :comments

  validates :title, presence: true

  accepts_nested_attributes_for :picture_tags

end

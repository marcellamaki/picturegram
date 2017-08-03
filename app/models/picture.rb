class Picture < ApplicationRecord
  belongs_to :user
  has_many :picture_tags
  has_many :tags, through: :picture_tags
  has_many :comments

  validates :title, presence: true

  accepts_nested_attributes_for :picture_tags

  def self.trending
    trending = Picture.all.sort_by {|picture| picture.created_at}.first(10)
      trending.sort_by { |picture| picture.comments.count}.reverse.first(3)
  end

end

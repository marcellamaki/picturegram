class User < ApplicationRecord

  has_secure_password

  has_many :pictures
  has_many :likes
  has_many :comments
  has_many :picture_tags, through: :pictures
  has_many :tags, through: :picture_tags

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def received_comments
        self.pictures.collect do |picture|
            picture.comments.collect do |comment|
              comment.content
        end.flatten
    end.flatten
end
end

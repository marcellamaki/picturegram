class User < ApplicationRecord

  has_secure_password
  
  has_many :pictures
  has_many :comments
  has_many :picture_tags, through: :pictures
  has_many :tags, through: :picture_tags

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def received_comments
  	comment = this_user.pictures.each do |picture|
  		picture.comments
  	end
  end
end
# Comments.where(comment.picture_id = user.picture.id)

# Define an instance method for a user called received_comments that shows all the comments made on that user's pictures.

# Return all of the comments.
# From those comments, find all of the comments where the picture is a picture that was posted by this user.

# Go through the pictures and return all the comments for each picture


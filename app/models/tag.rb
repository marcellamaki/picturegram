class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  validates :name, presence: true

  def self.most_popular
    # Tag.group('picture_tag').order('count(*)').limit(1).pluck(:tag).first
    popular = Tag.all.sort_by {|tag| tag.pictures.count}
    popular.map {|tag| tag}.reverse.first(3)
  end

    #look through all the pictures
    #sort the tags, and find which one has been used most often
    #return that tag
    #return all pictures that have used that tag

  def self.trending
    trending = Picture.first(10).sort_by {|picture| picture.created_at}
      trending.map { |picture| picture.comments.count}.reverse.first(3)
    #of the 10 most recent pictures
    #find the picture with the most comments
    #return the tag(s) associated with that picture
  end




end

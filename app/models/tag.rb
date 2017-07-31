class Tag < ApplicationRecord
  belongs_to :picture_tag

  validates :name, presence: true

  def self.most_popular
    tag = self.order(:picture_tag_id).first(3)
    # self.sort_by {|tag| tag.picture.length}
  end



end

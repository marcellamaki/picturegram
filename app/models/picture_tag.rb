class PictureTag < ApplicationRecord
  belongs_to :picture
  has_many :tags
end

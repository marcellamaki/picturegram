class PictureTag < ApplicationRecord
  belongs_to :picture
  belongs_to :tag

  accepts_nested_attributes_for :tag
end

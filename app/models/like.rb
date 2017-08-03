class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  def like_picture
    count = 0
  end

end

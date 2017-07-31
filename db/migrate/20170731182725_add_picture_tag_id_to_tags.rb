class AddPictureTagIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :picture_tag_id, :integer
  end
end

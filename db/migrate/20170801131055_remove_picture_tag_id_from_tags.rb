class RemovePictureTagIdFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags, :picture_tag_id
  end
end

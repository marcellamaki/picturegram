class AddTimestampToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column(:pictures, :created_at, :datetime)
    add_column(:pictures, :updated_at, :datetime)
  end
end

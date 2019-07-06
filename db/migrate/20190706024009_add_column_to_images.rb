class AddColumnToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_size, :string
    add_column :images, :image_content_type, :string
  end
end

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image_id
      t.string :image_filename
      t.string :url
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end

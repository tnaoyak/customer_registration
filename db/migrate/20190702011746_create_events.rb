class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.references :school
      t.string :web_public
      t.text :remarks
      t.timestamps
    end
  end
end

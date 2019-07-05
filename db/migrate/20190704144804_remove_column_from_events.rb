class RemoveColumnFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :image_id, :string
  end
end

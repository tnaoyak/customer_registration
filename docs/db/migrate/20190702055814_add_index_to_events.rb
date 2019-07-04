class AddIndexToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :school_id, :reference
    add_reference :events, :school, foreign_key: true
  end
end

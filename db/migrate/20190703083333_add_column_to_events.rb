class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :public_start_date, :string
    add_column :events, :public_end_date, :string
  end
end

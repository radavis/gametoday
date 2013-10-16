class AddColumnsToEvents < ActiveRecord::Migration
  def up
    add_column :events, :title, :string, null: false
    add_column :events, :datetime_local, :string, null: false
    add_column :events, :type, :string, null: false
    add_column :events, :location, :string, null: false
    add_column :events, :venue, :string, null: false
    add_column :events, :url, :string, null: false
  end

  def down
    remove_column :events, :title, :string
    remove_column :events, :datetime_local, :string
    remove_column :events, :type, :string
    remove_column :events, :location, :string
    remove_column :events, :venue, :string
    remove_column :events, :url, :string
  end
end

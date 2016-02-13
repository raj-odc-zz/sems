class AddColumnToFeesType < ActiveRecord::Migration[5.0]
  def change
    add_column :fees_types, :name, :string
  end
end

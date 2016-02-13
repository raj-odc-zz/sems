class AddColumnToProfileType < ActiveRecord::Migration[5.0]
  def change
    add_column :profile_types, :name, :string
  end
end

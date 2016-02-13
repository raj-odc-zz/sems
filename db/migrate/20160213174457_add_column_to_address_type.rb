class AddColumnToAddressType < ActiveRecord::Migration[5.0]
  def change
    add_column :address_types, :name, :string
  end
end

class AddColumnToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :address1, :string
    add_column :addresses, :address2, :string
    add_column :addresses, :landmark, :string
    add_column :addresses, :zipcode, :string
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_reference :addresses, :profile, foreign_key: true
    add_reference :addresses, :address_type, foreign_key: true
  end
end

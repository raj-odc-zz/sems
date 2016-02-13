class AddColumnToAmountTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :amount_transactions, :parent_id, :integer
    add_column :amount_transactions, :parent_name, :string
    add_column :amount_transactions, :amount, :float
  end
end

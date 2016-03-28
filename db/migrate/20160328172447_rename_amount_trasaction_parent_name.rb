class RenameAmountTrasactionParentName < ActiveRecord::Migration[5.0]
  def change
    rename_column :amount_transactions, :parent_name, :parent_type
  end
end

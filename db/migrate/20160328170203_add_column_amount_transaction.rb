class AddColumnAmountTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :amount_transactions, :profile_id, :integer
    add_column :amount_transactions, :payment_mode, :string
    add_column :amount_transactions, :bill_no, :string
    add_column :amount_transactions, :transaction_date, :date
    add_column :amount_transactions, :processed_by, :integer
    add_column :amount_transactions, :transaction_id, :string
  end
end

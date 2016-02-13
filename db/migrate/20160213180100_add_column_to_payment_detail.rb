class AddColumnToPaymentDetail < ActiveRecord::Migration[5.0]
  def change
    add_reference :payment_details, :profile, foreign_key: true
    add_reference :payment_details, :payment_info, foreign_key: true
    add_column :payment_details, :paid_amount, :float
  end
end

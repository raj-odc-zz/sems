class AddColumnToPaymentInfo < ActiveRecord::Migration[5.0]
  def change
    add_reference :payment_infos, :class_list, foreign_key: true
    add_reference :payment_infos, :board, foreign_key: true
    add_reference :payment_infos, :fees_type, foreign_key: true
    add_column :payment_infos, :amount, :float
  end
end

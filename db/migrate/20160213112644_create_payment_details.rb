class CreatePaymentDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_details do |t|

      t.timestamps
    end
  end
end

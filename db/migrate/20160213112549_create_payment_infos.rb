class CreatePaymentInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_infos do |t|

      t.timestamps
    end
  end
end

class RenamePaymentInfoFeesStructure < ActiveRecord::Migration[5.0]
  def change
  	rename_table :payment_infos, :fees_structures
  end
end

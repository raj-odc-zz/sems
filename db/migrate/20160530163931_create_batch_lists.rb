class CreateBatchLists < ActiveRecord::Migration[5.0]
  def change
    create_table :batch_lists do |t|
      t.string :academic_year
      t.references :board, foreign_key: true
      t.timestamps
    end
  end
end

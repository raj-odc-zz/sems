class CreateStatusTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :status_types do |t|

      t.timestamps
    end
  end
end

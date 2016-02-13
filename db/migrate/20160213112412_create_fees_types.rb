class CreateFeesTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :fees_types do |t|

      t.timestamps
    end
  end
end

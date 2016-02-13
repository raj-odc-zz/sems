class CreateClassLists < ActiveRecord::Migration[5.0]
  def change
    create_table :class_lists do |t|

      t.timestamps
    end
  end
end

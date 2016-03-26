class CreateStaffClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_classes do |t|
      t.references :class_list, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end

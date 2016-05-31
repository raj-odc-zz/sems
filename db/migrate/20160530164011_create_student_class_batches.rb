class CreateStudentClassBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :student_class_batches do |t|
      t.references :batch_list, foreign_key: true
      t.references :profile, foreign_key: true
      t.references :class_list, foreign_key: true
      t.timestamps
    end
  end
end

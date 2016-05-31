class CreateStudentTransports < ActiveRecord::Migration[5.0]
  def change
    create_table :student_transports do |t|
      t.references :route_stop_info, foreign_key: true
      t.references :profile, foreign_key: true
      t.timestamps
    end
  end
end

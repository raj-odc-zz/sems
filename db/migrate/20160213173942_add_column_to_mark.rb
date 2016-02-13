class AddColumnToMark < ActiveRecord::Migration[5.0]
  def change
    add_column :marks, :mark, :string
    add_reference :marks, :subject, foreign_key: true
    add_reference :marks, :profile, foreign_key: true
    add_reference :marks, :exam_type, foreign_key: true
  end
end

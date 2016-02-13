class AddColumnToExamType < ActiveRecord::Migration[5.0]
  def change
    add_column :exam_types, :name, :string
    add_reference :exam_types, :class_list, foreign_key: true
    add_column :exam_types, :major, :string
  end
end

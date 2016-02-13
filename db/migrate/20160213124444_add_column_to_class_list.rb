class AddColumnToClassList < ActiveRecord::Migration[5.0]
  def change
    add_column :class_lists, :name, :string
    add_reference :class_lists, :board, foreign_key: true
    add_column :class_lists, :class, :string
    add_column :class_lists, :section, :string
    add_column :class_lists, :major, :string
  end
end

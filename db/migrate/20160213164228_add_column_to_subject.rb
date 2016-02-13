class AddColumnToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :name, :string
    add_reference :subjects, :class_list, foreign_key: true
  end
end

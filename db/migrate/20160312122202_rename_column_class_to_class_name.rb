class RenameColumnClassToClassName < ActiveRecord::Migration[5.0]
  def change
    rename_column :class_lists, :class, :class_name
    rename_column :profiles, :board_type_id, :board_id
  end
end

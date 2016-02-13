class AddColumnToBoardType < ActiveRecord::Migration[5.0]
  def change
    add_column :board_types, :name, :string
  end
end

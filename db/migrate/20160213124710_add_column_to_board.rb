class AddColumnToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :name, :string
    add_reference :boards, :board_type, foreign_key: true
  end
end

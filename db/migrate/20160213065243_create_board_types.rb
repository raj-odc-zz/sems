class CreateBoardTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :board_types do |t|

      t.timestamps
    end
  end
end

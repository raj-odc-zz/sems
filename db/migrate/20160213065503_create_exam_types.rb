class CreateExamTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_types do |t|

      t.timestamps
    end
  end
end

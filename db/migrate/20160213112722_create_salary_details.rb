class CreateSalaryDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :salary_details do |t|

      t.timestamps
    end
  end
end

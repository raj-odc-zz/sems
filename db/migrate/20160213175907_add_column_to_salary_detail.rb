class AddColumnToSalaryDetail < ActiveRecord::Migration[5.0]
  def change
    add_reference :salary_details, :profile, foreign_key: true
    add_reference :salary_details, :board, foreign_key: true
    add_reference :salary_details, :fees_type, foreign_key: true
    add_column :salary_details, :amount, :float
  end
end

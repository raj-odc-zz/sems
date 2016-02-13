class AddColumnToUserPreviousDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :user_previous_details, :display_order, :integer
    add_reference :user_previous_details, :profile, foreign_key: true
    add_column :user_previous_details, :board_name, :string
    add_column :user_previous_details, :designation, :string
    add_column :user_previous_details, :years_on_board, :integer
    add_column :user_previous_details, :reason, :string
    add_column :user_previous_details, :date_joined, :date
    add_column :user_previous_details, :date_relieved, :date
    add_column :user_previous_details, :is_student, :boolean
  end
end

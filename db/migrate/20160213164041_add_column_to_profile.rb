class AddColumnToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :roll_no, :integer
    add_reference :profiles, :profile_type, foreign_key: true
    add_reference :profiles, :board_type, foreign_key: true
    add_reference :profiles, :class_list, foreign_key: true
    add_reference :profiles, :user, foreign_key: true
    add_column :profiles, :father_name, :string
    add_column :profiles, :mother_name, :string
    add_column :profiles, :gender, :string
    add_column :profiles, :marital_status, :string
    add_column :profiles, :husband_name, :string
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :emergency_contact_number, :string
    add_column :profiles, :guardian_contact_number, :string
    add_column :profiles, :guardian_email_id, :string
    add_column :profiles, :blood_group, :string
  end
end

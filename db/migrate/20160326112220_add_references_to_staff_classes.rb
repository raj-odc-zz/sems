class AddReferencesToStaffClasses < ActiveRecord::Migration[5.0]
  def change
    add_reference :staff_classes, :subject, foreign_key: true
  end
end

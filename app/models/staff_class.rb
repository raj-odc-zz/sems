class StaffClass < ApplicationRecord
  belongs_to :class_list
  belongs_to :staff, :foreign_key => :profile_id, :primary_key => :id
  belongs_to :subject
end

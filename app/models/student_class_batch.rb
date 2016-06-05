class StudentClassBatch < ApplicationRecord
  belongs_to :class_list
  belongs_to :batch_list
  belongs_to :profile

  scope :batch_by_profile, ->(profile_id) { where("profile_id =?",profile_id)}

end

class StudentClassBatch < ApplicationRecord
  belongs_to :class_list
  belongs_to :batch_list
  belongs_to :profile

end

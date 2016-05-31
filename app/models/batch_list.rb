class BatchList < ApplicationRecord
  belongs_to :board
  has_many :staff_class_batches
  has_many :student_class_batches
end

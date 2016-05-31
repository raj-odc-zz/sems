class Subject < ApplicationRecord
  has_many :marks
  has_many :staff_classes
  belongs_to :class_list
  has_many :staff_class_batches

  #
  scope :fetch_by_class, ->(class_id) { where("subjects.class_list_id =?",class_id)}
  scope :fetch_by_exam_type, ->(class_id,exam_type_id,stud_id) { eager_load(:marks).fetch_by_class(class_id).where("marks.exam_type_id=? and marks.profile_id=?",exam_type_id,stud_id)}
end

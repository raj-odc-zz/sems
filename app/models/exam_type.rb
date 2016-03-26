class ExamType < ApplicationRecord
  has_many :mark
  belongs_to :class_list
  #
  scope :fetch_by_class, ->(class_id) { where("exam_types.class_list_id =?",class_id)}
  scope :fetch_by_classes, ->(class_ids) { where("exam_types.class_list_id IN(?)",class_ids)}

end

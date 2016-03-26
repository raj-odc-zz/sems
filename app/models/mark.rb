class Mark < ApplicationRecord
  belongs_to :profile
  belongs_to :exam_type
  belongs_to :subject

  scope :fetch_by_class, ->(class_id,exam_type_id) { eager_load(:profile,:exam_type,:subject)
            .where("profiles.class_list_id=? and exam_types.id=?",class_id,exam_type_id) }
end

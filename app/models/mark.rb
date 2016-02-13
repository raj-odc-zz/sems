class Mark < ApplicationRecord
  belongs_to :profile
  belongs_to :exam_type
  belongs_to :subject
end

class Subject < ApplicationRecord
  has_many :mark
  belongs_to :class_list
end

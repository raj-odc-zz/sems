class ClassList < ApplicationRecord
  has_many :profile
  belongs_to :board
  has_many :subject
  has_many :class_list
end

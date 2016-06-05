class ClassList < ApplicationRecord
  has_many :profiles
  belongs_to :board
  has_many :subjects
  has_many :exam_types
  has_many :fees_structures
  has_many :staff_class_batches
  has_many :student_class_batches
  #scopes
  scope :class_list_by_board, ->(board_id) { where("board_id =?",board_id)}
  scope :find_all_by_ids, ->(ids) { where("id IN(?)",ids)}
  #
  delegate :name, :to => :board, :prefix => true, :allow_nil => true

  def class_section
    self.class_name + "-" + self.section
  end
end

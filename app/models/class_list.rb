class ClassList < ApplicationRecord
  has_many :profiles
  belongs_to :board
  has_many :subjects
  has_many :exam_types
  #scopes
  scope :class_list_by_board, ->(board_id) { where("board_id =?",board_id)}
  scope :find_all_by_ids, ->(ids) { where("id IN(?)",ids)}
  #
  delegate :name, :to => :board, :prefix => true, :allow_nil => true
end

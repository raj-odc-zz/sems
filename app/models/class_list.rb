class ClassList < ApplicationRecord
  has_many :profiles
  belongs_to :board
  has_many :subjects
  #scopes
  scope :class_list_by_board, ->(board_id) { where("board_id =?",board_id)}
  #
  delegate :name, :to => :board, :prefix => true, :allow_nil => true
end

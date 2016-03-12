class ClassList < ApplicationRecord
  has_many :profile
  belongs_to :board
  has_many :subject
  has_many :class_list
  #scopes
  scope :class_list_by_board, ->(board_id) { where("board_id =?",board_id)}
end

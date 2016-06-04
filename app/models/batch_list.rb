class BatchList < ApplicationRecord
  belongs_to :board
  has_many :staff_class_batches

  has_many :student_class_batches
  has_many :class_lists, through: :student_class_batches
  scope :batch_list_by_board, ->(board_id) { where("board_id =?",board_id)}
end

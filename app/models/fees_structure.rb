class FeesStructure < ApplicationRecord
  belongs_to :class_list
  belongs_to :board
  belongs_to :fees_type
  before_create :update_board_id
  has_many :amount_transactions, as: :parent
  current_board = Board.last
  default_scope { where("board_id =?",current_board.id) }
  def update_board_id
  	self.board_id=Board.last.id
  end
end

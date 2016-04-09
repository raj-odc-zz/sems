class SalaryDetail < ApplicationRecord
  belongs_to :profile
  belongs_to :board_id
  belongs_to :fees_type
  has_many :amount_transactions, as: :parent
end

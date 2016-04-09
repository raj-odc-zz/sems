class SalaryDetail < ApplicationRecord
  belongs_to :profile
  belongs_to :board_id
  belongs_to :fees_type
  belongs_to :parent, polymorphic: true
end

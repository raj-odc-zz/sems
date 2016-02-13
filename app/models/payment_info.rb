class PaymentInfo < ApplicationRecord
  belongs_to :class_list
  belongs_to :board
  belongs_to :fees_type
end

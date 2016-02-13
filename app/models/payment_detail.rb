class PaymentDetail < ApplicationRecord
  belongs_to :profile
  belongs_to :payment_info
end

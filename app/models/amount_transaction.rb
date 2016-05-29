class AmountTransaction < ApplicationRecord
  belongs_to :profile
  belongs_to :parent, polymorphic: true
  scope :based_on_month, ->(month_no) { where('extract(month from transaction_date) = ?', month_no) }
end

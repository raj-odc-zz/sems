class FeesType < ApplicationRecord
  has_many :payment_info
  has_many :salary_info
  
end

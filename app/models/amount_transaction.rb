class AmountTransaction < ApplicationRecord
  belongs_to :profile
  belongs_to :parent, polymorphic: true
end

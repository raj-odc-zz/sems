class Address < ApplicationRecord
belongs_to :profile
belongs_to :address_type
end

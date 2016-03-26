class Address < ApplicationRecord
  belongs_to :profile
  belongs_to :address_type
  #
  scope :primary_address, ->{ where("address_type_id=?",AddressType.find_by_name("primary"))}
  scope :secondary_address, ->{ where("address_type_id=?",AddressType.find_by_name("secondary"))}
  #
end

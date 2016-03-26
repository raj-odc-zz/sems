class Staff < ApplicationRecord
  default_scope { joins(:profile_type).where("profile_types.name =?","staff")}
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  belongs_to :class_list
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_detail
  has_many :payment_detail
  self.table_name = "profiles"
end



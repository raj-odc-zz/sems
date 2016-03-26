class Student < ApplicationRecord
  self.table_name = "profiles"
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  belongs_to :class_list
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :payment_detail
  # has_many :rank
  default_scope { joins(:profile_type).where("profile_types.name =?","student")}
  scope :fetch_by_class, ->(class_id) { where("profiles.class_list_id=?",class_id)}
end


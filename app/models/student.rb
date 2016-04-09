class Student < ApplicationRecord
  self.table_name = "profiles"
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  belongs_to :class_list
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :amount_transactions,:foreign_key => :profile_id, :primary_key => :id
  # has_many :rank
  default_scope { joins(:profile_type).where("profile_types.name =?","student")}
  scope :fetch_by_class, ->(class_id) { where("profiles.class_list_id=?",class_id)}
  scope :fetch_by_classes, ->(class_ids) { where("profiles.class_list_id IN(?)",class_ids)}

  def name
    first_name + ' ' + last_name
  end
end



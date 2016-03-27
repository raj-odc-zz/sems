class Staff < ApplicationRecord
  self.table_name = "profiles"
  default_scope { joins(:profile_type).where("profile_types.name =?","staff")}
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  has_many :staff_classes, :foreign_key => :profile_id, :primary_key => :id
  has_many :class_lists , through: :staff_classes
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_detail
  has_many :payment_detail
  scope :fetch_by_class, ->(class_id) { joins(:class_lists).where("class_lists.id=?",class_id)}

  def name
    first_name + ' ' + last_name
  end
end



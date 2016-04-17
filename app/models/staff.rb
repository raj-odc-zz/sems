class Staff < ApplicationRecord
  self.table_name = "profiles"
  default_scope { joins(:profile_type).where("profile_types.name =?","staff")}
  current_board = Board.last
  default_scope { where("board_id =?",current_board.id) }
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  has_many :staff_classes, :foreign_key => :profile_id, :primary_key => :id
  has_many :class_lists , through: :staff_classes
  has_many :work_experiences, :foreign_key => :profile_id, :primary_key => :id
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_details, :foreign_key => :profile_id, :primary_key => :id
  has_many :amount_transactions, :foreign_key => :profile_id, :primary_key => :id
  accepts_nested_attributes_for :work_experiences
  scope :fetch_by_class, ->(class_id) { joins(:class_lists).where("class_lists.id=?",class_id)}
  scope :fetch_by_ids, ->(ids) { where("profiles.id IN(?)",ids)}

  def name
    first_name + ' ' + last_name
  end
end



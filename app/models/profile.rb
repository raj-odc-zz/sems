class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  belongs_to :class_list
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_details
  has_many :staff_class_batches
  has_many :student_class_batches
  has_many :student_transports

  # has_many :amount_transactions
  # validattions
  # validates_presence_of :user
  current_board = Board.last
  default_scope { where("board_id =?",current_board.id) }
  #
  accepts_nested_attributes_for :addresses
  #
  scope :fetch_by_ids, ->(ids) { where("id IN(?)",ids)}
  # def self.name
  #   self.first_name.to_s +' '+ self.last_name.to_s
  # end

  enum gender_list: {
           'Male'   => 'male',
           'Female'  => 'female',
           'Other' => 'other'
       }
  enum married_status_list: {
           'Single'   => 'single',
           'Married'  => 'married'
       }

  def name
    first_name + ' ' + last_name
  end

  class << self
    def load_data
      # return .all,Board.all,
    end
  end
end

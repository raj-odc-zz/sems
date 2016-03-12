class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :profile_type
  belongs_to :board
  has_many :address
  belongs_to :class_list
  belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_detail
  has_many :payment_detail
  # validattions
  validates_presence_of :user
  #
  #
  class << self
    def load_data
      # return Role.all,Board.all,
    end
  end
end

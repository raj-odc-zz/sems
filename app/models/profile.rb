class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :profile_type
  belongs_to :board
  has_many :addresses
  belongs_to :class_list
  # belongs_to :logo_image
  has_many :user_previous_details
  has_many :salary_details
  # has_many :amount_transactions
  # validattions
  # validates_presence_of :user
  #
  accepts_nested_attributes_for :addresses
  #

  # def self.name
  #   self.first_name.to_s +' '+ self.last_name.to_s
  # end
  def name
    first_name + ' ' + last_name
  end
  class << self
    def load_data
      # return .all,Board.all,
    end
  end
end

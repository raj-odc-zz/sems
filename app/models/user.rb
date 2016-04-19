class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  belongs_to :role
  attr_accessor :profile_type
  after_create :create_profile

  private

  def create_profile
    if self.profile_type
      profile_type = ProfileType.find_by_name self.profile_type
      current_board = Board.last
      Profile.create(:profile_type_id => profile_type.try(:id), :user_id => self.id, :board_id => current_board.id)
    end
  end
  #private
=begin
  def encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
=end
end

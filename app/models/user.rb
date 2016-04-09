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
    profile_type = ProfileType.find_by_name self.profile_type
    self.create(:profile_type_id => profile_type.try(:id))
  end
  #private
=begin
  def encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
=end
end

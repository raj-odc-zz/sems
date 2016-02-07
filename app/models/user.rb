class User < ActiveRecord::Base
  attr_accessor :password,:password_conformation
  #private
  def encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end
end
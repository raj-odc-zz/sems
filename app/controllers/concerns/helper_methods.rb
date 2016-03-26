module HelperMethods
  extend ActiveSupport::Concern
  included do
    helper_method :current_user_profile, :current_board
  end

  def current_user_profile
    @current_profile ||= User.find_by_id(1).try(:profile)
  end

  def current_board
    @current_board ||= current_user_profile.try(:board)
  end
end
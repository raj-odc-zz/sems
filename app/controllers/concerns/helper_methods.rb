module HelperMethods
  extend ActiveSupport::Concern
  included do
    helper_method :current_user_profile
  end

  def current_user_profile
    # current_user.try(:profile)
    User.find_by_id(1).try(:profile)
  end
end
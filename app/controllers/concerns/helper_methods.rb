module HelperMethods
  extend ActiveSupport::Concern
  included do
    helper_method :current_user_profile, :current_board, :staff_user, :student_user
  end

  def current_user_profile
    @current_profile ||= User.find_by_id(current_user.try(:id)).try(:profile)
  end

  def current_board
    @current_board ||= current_user_profile.try(:board)
  end

  def student_user
    @staff ||= Student.find_by_user_id current_user.try(:id)
  end


  def staff_user
    @student ||= Staff.find_by_user_id current_user.try(:id)
  end

end
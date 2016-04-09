module HelperMethods
  extend ActiveSupport::Concern
  included do
    helper_method :current_user_profile, :current_board, :staff_user, :student_user, :fetch_values
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

  def check_profile(object)
    object.try(:profile_type).try(:name) == "student" ? true : false
  end

  def fetch_values(object)
    check_profile(object) ? common_variables_for_students : common_variables_for_staff
  end

  def common_variables_for_students
    return {"invoice" => "Bill"}
  end

  def common_variables_for_staff
    return {"invoice" => "Payslip"}
  end
end
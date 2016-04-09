class WorkExperiencesController < ApplicationController
  #
  before_action :redirect_new_profile,only: [:new, :edit]
  #
  def index
  end
  #
  def new
    @staff = staff_user
    @staff.work_experiences.new
  end
  #
  def create

  end
  #
  def edit
    @staff = staff_user
  end
  #
  private
  #
  def user_has_profile?
    return current_user.profile.present?
  end


  def redirect_new_profile
    redirect_to new_profile_path unless user_has_profile?
  end

end

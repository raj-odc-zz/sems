class ProfilesController < ApplicationController
  #
  # layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  before_action :load_data, only:[:new]
  #
  def new
    begin
      user_has_role?
      @profile = Profile.new(user_id: params.try(:[],"user_id"))
    rescue Exception => e
      redirect_to root_path
    end
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @role = Profile.find_by_id params[:id]
  end
  #
  def find_user_by_id
    @user = User.find_by_id params[:user_id]
  end
  #
  def user_has_role?
    find_user_by_id
    profile = @user.profile.try(:first)
    redirect_to edit_profile(profile.id) unless profile.nil?
  end

  def load_data
    @roles,@boards,@class_lists = Profile.load_data
  end
end

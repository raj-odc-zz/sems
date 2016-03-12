class ProfilesController < ApplicationController
  #
  # layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  before_action :load_data, only:[:new, :edit]
  #
  def new
    begin
      user_has_profile?
      @profile = Profile.new(user_id: params.try(:[],"user_id"))
    rescue Exception => e
      redirect_to root_path
    end
  end
  #
  def create

  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @profile = Profile.find_by_id params[:id]
  end
  #
  def find_user_by_id
    @user = User.find_by_id params[:user_id]
  end
  #
  def user_has_profile?
    find_user_by_id
    profile = @user.profile
    redirect_to edit_profile_path(profile.id) if profile.present?
  end

  def load_data
    @boards = Board.all
    @profile_types = ProfileType.all
    @profile.addresses.new unless @profile.addresses.present?

  end
end

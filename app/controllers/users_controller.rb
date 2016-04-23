class UsersController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit,:update,:destroy]
  before_action :load_data, only: [:edit,:new]
  def index
    respond_to do |format|
      format.html
      format.json { render json: { data: User.all}}
    end
  end

  def create
    @user = User.create(permit_all_params(:user))
    @user.build_profile(permit_all_params(:profile)).save
    render json: { status: 200 }
  end

  def new
    @user = User.new()
    if params.try(:[],"profile_type")
      profile_type = ProfileType.find_by_name(params[:profile_type]).id
      current_board = Board.last
      @profile = @user.build_profile(:profile_type_id => profile_type, :board_id => current_board.id)
    else
      @user.profile_type = nil
    end

  end

  def edit
  end

  def update
    @user.update_attributes(permit_all_params(:user))
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end
  #
  private
  #
  def load_data
    @roles = Role.all
  end
  #
  def find_by_id
    @user = User.find_by_id params[:id]
  end
end

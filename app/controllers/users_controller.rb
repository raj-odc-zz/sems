class UsersController < ApplicationController
  #
  before_filter :find_by_id, only: [:edit,:update,:destroy]
  before_filter :load_data, only: [:edit,:new]
  def index
    respond_to do |format|
      format.html
      format.json { render json: { data: User.all}}
    end
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
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

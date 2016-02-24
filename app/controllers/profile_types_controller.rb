class ProfileTypesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @profile_type = ProfileType.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @profile_type = ProfileType.find_by_id params[:id]
  end
end

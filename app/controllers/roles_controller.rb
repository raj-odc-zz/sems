class RolesController < ApplicationController
  #
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @role = Role.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @role = Role.find_by_id params[:id]
  end
end

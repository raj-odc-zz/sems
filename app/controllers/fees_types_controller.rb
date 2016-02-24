class FeesTypesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @fees_type = FeesType.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @fees_type = FeesType.find_by_id params[:id]
  end
end

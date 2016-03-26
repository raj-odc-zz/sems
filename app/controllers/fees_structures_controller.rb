class FeesStructuresController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
    @fees_structure = FeesStructure.all
  end

  def new
    @fees_structure = FeesStructure.new
  end
  #
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @fees_structure = FeesStructure.find_by_id params[:id]
  end
end 

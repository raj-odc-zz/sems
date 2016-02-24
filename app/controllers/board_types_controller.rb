class BoardTypesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @board_type = BoardType.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @board_type = BoardType.find_by_id params[:id]
  end
end

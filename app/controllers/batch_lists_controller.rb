class BatchListsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def update_batch_list
    @batch_lists = BatchList.batch_list_by_board params.try(:[],"board_id")

  end

  def index
    # @batch_lists = BatchList.batch_list_by_board current_board.try(:all)
  end

  def new
    @batch_list = BatchList.new
  end
  #
  def batch_list_info

  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @batch_list = BatchList.find_by_id params[:id]
  end
end

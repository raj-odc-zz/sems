class ClassListsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def update_class_list
    @class_lists = ClassList.class_list_by_board params.try(:[],"board_id")
  end

  def index
    @boards = Board.all
  end

  def new
    @class_list = class_list.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @class_list = Role.find_by_id params[:id]
  end
end

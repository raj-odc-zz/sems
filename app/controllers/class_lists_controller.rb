class ClassListsController < ApplicationController
  def update_class_list
    @class_lists = ClassList.class_list_by_board params.try(:[],"board_id")
  end
end

class Api::StaffsController < ApplicationController
  def index
    @staffs = Staff.fetch_by_class params.try(:[],"class_list_id")
    respond_to do |format|
      format.json { }
    end
  end
end

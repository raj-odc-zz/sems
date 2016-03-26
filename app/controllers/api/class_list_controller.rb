class Api::ClassListController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    @class_lists = ClassList.all
    respond_to do |format|
      format.json
    end
  end
  #
  def create
    class_list = ClassList.create(permit_all_params(:class_list))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: class_list.try(:errors).try(:messages)}
  end
  #
  def update
    @class_list.update_attributes(permit_all_params(:class_list))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @class_list.try(:errors).try(:messages)}
  end
  #
  def destroy
    @class_list.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @class_list.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @class_list = ClassList.find_by_id params[:id]
  end
end

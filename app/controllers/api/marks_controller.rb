class Api::MarksController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    @marks = Mark.fetch_by_class params.try(:[],"class_list_id"),params.try(:[],"exam_type_id")
    respond_to do |format|
      format.json { }
    end
  end
  #
  def create
    mark = Mark.create(permit_all_params(:mark))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: mark.try(:errors).try(:messages)}
  end
  #
  def update
    @mark.update_attributes(permit_all_params(:mark))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @mark.try(:errors).try(:messages)}
  end
  #
  def destroy
    @mark.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @mark.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @mark = Mark.find_by_id params[:id]
  end
end

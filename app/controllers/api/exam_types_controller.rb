class Api::ExamTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    exam_types = ExamType.fetch_by_class params.try(:[],"class_list_id")
    respond_to do |format|
      format.json { render json: { data: exam_types,total: exam_types.size}}
    end
  end
  #
  def create
    exam_type = ExamType.create(permit_all_params(:exam_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: exam_type.try(:errors).try(:messages)}
  end
  #
  def update
    @exam_type.update_attributes(permit_all_params(:exam_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @exam_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @exam_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @exam_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @exam_type = ExamType.find_by_id params[:id]
  end
end

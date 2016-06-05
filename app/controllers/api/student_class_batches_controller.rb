class Api::StudentClassBatchesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]

  def index
    @batch_lists = StudentClassBatch.batch_by_profile(1)
    respond_to do |format|
      format.json #{ render json: { data: @class_lists,total: @class_lists.size}}
    end
  end
  #
  def create
    batch_list = StudentClassBatch.create(permit_all_params(:student_class_batch))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: batch_list.try(:errors).try(:messages)}
  end
  #
  def update
    @batch_list.update_attributes(permit_all_params(:student_class_batch))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @batch_list.try(:errors).try(:messages)}
  end
  #
  def destroy
    @batch_list.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @batch_list.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @batch_list = StudentClassBatch.find_by_id params[:id]
  end
end

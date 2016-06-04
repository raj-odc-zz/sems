class Api::BatchListsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    batch_list = BatchList.batch_list_by_board current_board.try(:id)
    respond_to do |format|
      format.json { render json: { data: batch_list,total: batch_list.size}}
    end
  end
  #
  def create
    batch_list = BatchList.create(permit_all_params(:batch_list))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: batch_list.try(:errors).try(:messages)}
  end
  #
  def update
    @batch_list.update_attributes(permit_all_params(:batch_list))
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
    @batch_list = BatchList.find_by_id params[:id]
  end
end

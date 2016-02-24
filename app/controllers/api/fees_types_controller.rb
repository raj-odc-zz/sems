class Api::FeesTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    fees_type = FeesType.all
    respond_to do |format|
      format.json { render json: { data: fees_type,total: fees_type.size}}
    end
  end
  #
  def create
    fees_type = FeesType.create(permit_all_params(:fees_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @fees_type.try(:errors).try(:messages)}
  end
  #
  def update
    @fees_type.update_attributes(permit_all_params(:fees_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @fees_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @fees_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @fees_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @fees_type = FeesType.find_by_id params[:id]
  end
end

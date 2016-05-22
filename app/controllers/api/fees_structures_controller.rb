class Api::FeesStructuresController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    @fees_structures = FeesStructure.all
    respond_to do |format|
      format.json
    end
  end
  #
  def create
    fees_structure= FeesStructure.create(permit_all_params(:fees_structure))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: fees_structure.try(:errors).try(:messages)}
  end
  #
  def update
    @fees_structure.update_attributes(permit_all_params(:fees_structure))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @fees_structure.try(:errors).try(:messages)}
  end
  #
  def destroy
    @fees_structure.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @fees_structure.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @fees_structure = FeesStructure.find_by_id params[:id]
  end
end

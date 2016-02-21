class Api::AddressTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    address_type = AddressType.all
    respond_to do |format|
      format.json { render json: { data: address_type,total: address_type.size}}
    end
  end
  #
  def create
    address_type = AddressType.create(permit_all_params(:address_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @address_type.try(:errors).try(:messages)}
  end
  #
  def update
    @address_type.update_attributes(permit_all_params(:address_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @address_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @address_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @address_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @address_type = AddressType.find_by_id params[:id]
  end
end

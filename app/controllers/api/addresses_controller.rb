class Api::AddressesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    address_list = Address.all
    respond_to do |format|
      format.json { render json: { data: address_list,total: address_list.size}}
    end
  end
  #
  def create
    address = Address.create(permit_all_params(:address))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: address.try(:errors).try(:messages)}
  end
  #
  def update
    @address.update_attributes(permit_all_params(:address))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @address.try(:errors).try(:messages)}
  end
  #
  def destroy
    @address.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @address.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @address = Address.find_by_id params[:id]
  end
end

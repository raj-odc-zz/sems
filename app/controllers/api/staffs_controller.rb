class Api::StaffsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  def index
    @staffs = Staff.all#fetch_by_class params.try(:[],"class_list_id")
    respond_to do |format|
      format.json { render json: { data: @staffs,total: @staffs.size}}
    end
  end
  def create
    staff= Staff.create(permit_all_params(:staff))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: staff.try(:errors).try(:messages)}
  end
  #
  def update
    @staff.update_attributes(permit_all_params(:staff))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @staff.try(:errors).try(:messages)}
  end
  #
  def destroy
    @staff.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @staff.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @staff = Staff.find_by_id params[:id]
  end
end

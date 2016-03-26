class Api::SalaryDetailsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    salary_details = SalaryDetail.all
    respond_to do |format|
       format.json { render json: { data: salary_details ,total: salary_details.size}}
    end
  end
  #
  def create
    salary_detail= SalaryDetail.create(permit_all_params(:salary_detail))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: salary_detail.try(:errors).try(:messages)}
  end
  #
  def update
    @salary_detail.update_attributes(permit_all_params(:salary_detail))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @salary_detail.try(:errors).try(:messages)}
  end
  #
  def destroy
    @salary_detail.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @salary_detail.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @salary_detail = SalaryDetail.find_by_id params[:id]
  end
end

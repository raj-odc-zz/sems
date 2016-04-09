class SalaryDetailsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
    @salary_details = SalaryDetail.all
  end

  def new
    @salary_detail = SalaryDetail.new
  end

  def pdf_pay_bil
    fetch_values
  end
  #
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @salary_detail = SalaryDetail.find_by_id params[:id]
  end
end

class Api::StudentsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    @students = Student.all#Student.fetch_by_class params.try(:[],"class_list_id")
    respond_to do |format|
      format.json { }
    end
  end
  #
  def create
    student = Student.create(permit_all_params(:student))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: student.try(:errors).try(:messages)}
  end
  #
  def update
    @student.update_attributes(permit_all_params(:student))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @student.try(:errors).try(:messages)}
  end
  #
  def destroy
    @student.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @student.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @student = Student.find_by_id params[:id]
  end
end

class Api::SubjectsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    subjects = Subject.fetch_by_class params.try(:[],"class_list_id")
    respond_to do |format|
      format.json { render json: { data: subjects,total: subjects.size}}
    end
  end
  #
  def create
    subject = Subject.create(permit_all_params(:subject))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: subject.try(:errors).try(:messages)}
  end
  #
  def update
    @subject.update_attributes(permit_all_params(:subject))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @subject.try(:errors).try(:messages)}
  end
  #
  def destroy
    @subject.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @subject.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @subject = Subject.find_by_id params[:id]
  end
end

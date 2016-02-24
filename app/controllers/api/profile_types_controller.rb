class Api::ProfileTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    profile_type = ProfileType.all
    respond_to do |format|
      format.json { render json: { data: profile_type,total: profile_type.size}}
    end
  end
  #
  def create
    profile_type = ProfileType.create(permit_all_params(:profile_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @profile_type.try(:errors).try(:messages)}
  end
  #
  def update
    @profile_type.update_attributes(permit_all_params(:profile_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @profile_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @profile_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @profile_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @profile_type = ProfileType.find_by_id params[:id]
  end
end

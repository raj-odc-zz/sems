class Api::RolesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    roles = Role.all
    respond_to do |format|
      format.json { render json: { data: roles,total: roles.size}}
    end
  end
  #
  def create
    role = Role.create(permit_all_params(:role))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: role.try(:errors).try(:messages)}
  end
  #
  def update
    @role.update_attributes(permit_all_params(:role))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @role.try(:errors).try(:messages)}
  end
  #
  def destroy
    @role.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @role.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @role = Role.find_by_id params[:id]
  end
end

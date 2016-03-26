class Api::ProfilesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    profiles = Profile.all
    respond_to do |format|
      format.json { render json: { data: profiles,total: profiles.size}}
    end
  end
  #
  def create
    profile = Profile.create(permit_all_params(:profile))
    render json: (messgaes =profile.try(:errors).try(:messages)).present? ? {error: messages, status:500} :  {status: 200}
  rescue
    render json: { status: 500,error: profile.try(:errors).try(:messages)}
  end
  #
  def update
    @profile.update_attributes(permit_all_params(:profile))
    render json: (messgaes =profile.try(:errors).try(:messages)).present? ? {error: messages, status:500} :  {status: 200}
  rescue
    render json: { status: 500,error: @profile.try(:errors).try(:messages)}
  end
  #
  def destroy
    @profile.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @profile.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @profile = Profile.find_by_id params[:id]
  end
end

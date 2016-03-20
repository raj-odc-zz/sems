class SiteCustomizationsController < ApplicationController
  #
  before_action :find_by_id, only: [:edit,:update,:destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: { data: SiteCustomization.all}}
    end
  end

  def create
    @site_customization = SiteCustomization.create(permit_all_params(:site_customization))
    respond_to do |format|
      format.js
    end
  end

  def new
    @site_customization = SiteCustomization.new
  end

  def edit
  end

  def update
    @site_customization.update_attributes(permit_all_params(:site_customization))
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @site_customization.destroy
    respond_to do |format|
      format.js
    end
  end
  #
  private
  #
  def find_by_id
    @site_customization = SiteCustomization.find_by_id params[:id]
  end
end

class AddressTypesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @address_type = AddressType.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @address_type = AddressType.find_by_id params[:id]
  end
end

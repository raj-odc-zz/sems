class AddressController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @address = Address.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @address = Address.find_by_id params[:id]
  end
end

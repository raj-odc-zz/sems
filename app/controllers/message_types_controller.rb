class MessageTypesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @message_type = MessageType.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @message_type = MessageType.find_by_id params[:id]
  end
end

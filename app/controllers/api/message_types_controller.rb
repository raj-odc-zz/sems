class Api::MessageTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    message_type = MessageType.all
    respond_to do |format|
      format.json { render json: { data: message_type,total: message_type.size}}
    end
  end
  #
  def create
    message_type = MessageType.create(permit_all_params(:message_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @message_type.try(:errors).try(:messages)}
  end
  #
  def update
    @message_type.update_attributes(permit_all_params(:message_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @message_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @message_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @message_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @message_type = MessageType.find_by_id params[:id]
  end
end

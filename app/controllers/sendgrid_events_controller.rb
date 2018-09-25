class SendgridEventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    sendgrid_event_params[:_json].each do |event_params|
      SendgridEvent.create(event_params)
    end
  end

  def index
    if params[:email] || params[:event]
      @sendgrid_events = SendgridEvent.filter_by(params[:email], params[:event])
    else
      @sendgrid_events = SendgridEvent.all.limit(20)
    end
  end

  private

  def sendgrid_event_params
    params.permit(_json: [:email, :timestamp, :event, :category, :sg_event_id, :sg_message_id, :attempt])
  end
end

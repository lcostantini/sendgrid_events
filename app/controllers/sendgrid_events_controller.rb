class SendgridEventsController < ApplicationController
  # This is here so I can use the script to send the webhook events
  skip_before_action :verify_authenticity_token

  def create
    sendgrid_event_params[:_json].each do |event_params|
      SendgridEvent.create(event_params)
    end
  end

  def index
    if sendgrid_event_params[:search].present?
      @sendgrid_events = SendgridEvent.filter_by(sendgrid_event_params[:search]).page(params[:page]).per(20)
    else
      @sendgrid_events = SendgridEvent.page(params[:page]).per(20)
    end
  end

  private

  def sendgrid_event_params
    params.permit(search: [:email, :event, :user_id],
                  _json: [:email, :timestamp, :event, :category,
                          :sg_event_id, :sg_message_id, :attempt]
    )
  end
end

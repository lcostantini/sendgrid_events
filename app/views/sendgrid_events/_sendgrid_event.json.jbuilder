json.extract! sendgrid_event, :id, :created_at, :updated_at
json.url sendgrid_event_url(sendgrid_event, format: :json)

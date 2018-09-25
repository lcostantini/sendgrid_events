require 'rails_helper'

RSpec.describe SendgridEventsController, type: :controller do
  describe '#post' do
    it 'save events received' do
      events = [
        {
          "email":"example@test.com",
          "timestamp":1513299569,
          "smtp-id":"<14c5d75ce93.dfd.64b469@ismtpd-555>",
          "event":"processed",
          "category":"cat facts",
          "sg_event_id":"event_2222",
          "sg_message_id":"message_8888"
        },
        {
          "email":"example@test.com",
          "timestamp":1513299569,
          "smtp-id":"<14c5d75ce93.dfd.64b469@ismtpd-555>",
          "event":"deferred",
          "category":"cat facts",
          "sg_event_id":"event_1111",
          "sg_message_id":"message_9999",
          "response":"400 try again later",
          "attempt":"5"
        }
      ]

      post :create, params: { _json: events }

      expect(response.code).to eq('204')
      expect(SendgridEvent.count).to eq(2)
    end
  end
end

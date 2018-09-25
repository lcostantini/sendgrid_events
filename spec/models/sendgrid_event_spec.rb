require 'rails_helper'

RSpec.describe SendgridEvent, type: :model do
  describe 'create a new event' do
    it 'receive and save an event' do
      events = [
        {
          "email":"example@test.com",
          "timestamp":1513299569,
          "event":"processed",
          "category":"cat facts",
          "sg_event_id":"event_2222",
          "sg_message_id":"message_8888"
        },
        {
          "email":"example@test.com",
          "timestamp":1513299569,
          "event":"deferred",
          "category":"cat facts",
          "sg_event_id":"event_1111",
          "sg_message_id":"message_9999",
          "attempt":"5"
        }
      ]

      events.each { |event| SendgridEvent.create(event) }

      expect(SendgridEvent.count).to eq(2)
    end
  end
end

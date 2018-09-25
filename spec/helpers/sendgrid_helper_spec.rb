require 'rails_helper'

RSpec.describe SendgridHelper, type: :helper do
  describe 'send email' do
    it 'send test email' do
      expect(SendgridHelper.send_test_email.status_code).to eq('202')
    end
  end
end

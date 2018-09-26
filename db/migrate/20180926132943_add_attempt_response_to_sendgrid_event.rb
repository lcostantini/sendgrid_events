class AddAttemptResponseToSendgridEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :sendgrid_events, :attempt, :integer
    add_column :sendgrid_events, :response, :text

    add_index :sendgrid_events, :category
  end
end

class AddUserIdToSendgridEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :sendgrid_events, :user_id, :string

    add_index :sendgrid_events, :user_id, unique: true
  end
end

class CreateSendgridEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :sendgrid_events do |t|
      t.string :email, null: false
      t.string :timestamp
      t.string :event, null: false
      t.string :category
      t.string :sg_event_id, null: false, unique: true
      t.string :sg_message_id, null: false

      t.timestamps

      t.index(:email)
      t.index(:event)
      t.index(:sg_event_id, unique: true)
    end
  end
end

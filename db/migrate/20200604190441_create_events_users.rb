class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users, id: false do |t|
      t.references :attendee
      t.references :attended_event
      t.timestamps
    end
  end
end
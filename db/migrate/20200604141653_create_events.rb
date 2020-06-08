class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :description
      t.references :creator
      t.timestamps
    end

  end
end

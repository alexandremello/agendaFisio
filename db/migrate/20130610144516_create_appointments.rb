class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :description
      t.boolean :allDay
      t.integer :patient_id
      t.boolean :canceled
      t.boolean :attended

      t.timestamps
    end
  end
end

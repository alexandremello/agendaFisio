class AddDescriptionToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :description, :text
  end
end

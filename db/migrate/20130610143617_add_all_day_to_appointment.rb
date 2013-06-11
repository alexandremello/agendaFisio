class AddAllDayToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :allDay, :boolean
  end
end

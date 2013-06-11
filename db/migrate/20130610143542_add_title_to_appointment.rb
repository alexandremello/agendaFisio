class AddTitleToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :title, :text
  end
end

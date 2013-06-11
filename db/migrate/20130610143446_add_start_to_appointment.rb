class AddStartToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :start, :datetime
  end
end

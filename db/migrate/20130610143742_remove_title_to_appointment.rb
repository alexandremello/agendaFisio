class RemoveTitleToAppointment < ActiveRecord::Migration
  def up
    remove_column :appointments, :title
  end

  def down
    add_column :appointments, :title, :text
  end
end

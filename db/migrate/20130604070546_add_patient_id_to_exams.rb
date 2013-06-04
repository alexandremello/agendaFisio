class AddPatientIdToExams < ActiveRecord::Migration
  def change
    add_column :exams, :patient_id, :integer
  end
end

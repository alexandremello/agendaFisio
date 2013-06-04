class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end

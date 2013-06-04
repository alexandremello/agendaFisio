class Exam < ActiveRecord::Base
  attr_accessible :date, :description

  belongs_to :patient
end

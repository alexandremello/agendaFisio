class Patient < ActiveRecord::Base
  attr_accessible :address, :birth, :name

  has_many :exams
end

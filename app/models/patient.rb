class Patient < ActiveRecord::Base
  attr_accessible :address, :birth, :name

  has_many :exams
  has_many :appointments
  has_one :user

	validates_presence_of :name
end

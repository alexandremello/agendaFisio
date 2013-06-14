class Patient < ActiveRecord::Base
  attr_accessible :address, :birth, :name

  has_many :exams
  has_many :appointments
  belongs_to :user

	validates_presence_of :name
end

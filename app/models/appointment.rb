class Appointment < ActiveRecord::Base
	attr_accessible :allDay, :attended, :canceled, :description, :end, :patient_id, :start, :title
  validates_presence_of :start, :end, :patient_id

	before_save :default_values
	before_destroy :setCanceled

	belongs_to :patient

	def default_values
		self.patient_id ||= 1
	end

	def setCanceled
		self.canceled = true
		false
	end

	def self.format_date(date_time)
		Time.at(date_time.to_i).to_formatted_s(:db)
	end

	scope :between, lambda {|start_time, end_time|
		{conditions: ['? < starts_at < ?',
		                 Appointment.format_date(start_time) ,
										 Appointment.format_date(end_time)]}
	}

	def as_json(options = {})
		{
				id:           self.id,
		    title:        self.title,
		    description:  self.description || '',
		    start:        starts_at.rfc822,
		    end:          ends_at.rfc822,
		    allDay:       self.allDay
		}
	end

end

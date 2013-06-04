class Patient < ActiveRecord::Base
  attr_accessible :address, :birth, :name
end

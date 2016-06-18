class Appointment < ActiveRecord::Base
  belongs_to :collaborator
  belongs_to :client
end

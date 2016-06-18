class Appointment < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :collaborator
  belongs_to :client
end

class Client < ActiveRecord::Base
  self.inheritance_column = nil
  belongs_to :person
  has_many :appointments
  has_many :collaborators, through: :appointments
end

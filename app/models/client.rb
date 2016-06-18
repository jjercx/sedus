class Client < ActiveRecord::Base
  belongs_to :person
  has_many :appointments
  has_many :collaborators, through: :appointments
end

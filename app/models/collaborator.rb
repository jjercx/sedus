class Collaborator < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :person
  has_many :appointments
  has_many :clients, through: :appointments
end

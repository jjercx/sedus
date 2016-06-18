class Collaborator < ActiveRecord::Base
  self.inheritance_column = nil
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :person

  has_many :appointments
  has_many :clients, through: :appointments

  delegate :first_name, :last_name, :dni, :birthday, :mobile, :phone, :address, :gender, :civil_status, to: :person
  delegate :email, prefix: true, to: :person

  enum role: [:simple, :admin, :super_admin]
  enum type: [:secretary, :doctor, :teacher]
  enum status: [:available, :unavailable]

end

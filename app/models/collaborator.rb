class Collaborator < ActiveRecord::Base
  self.inheritance_column = nil
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :person

  has_many :appointments
  has_many :clients, through: :appointments

  delegate :first_name, :last_name, :dni, :birthday, :mobile, :phone, :address, :gender, :civil_status, :name, to: :person, allow_nil: true
  delegate :email, prefix: true, to: :person, allow_nil: true

  enum role: [:simple, :admin, :super_admin]
  enum type: [:secretary, :doctor, :teacher]
  enum status: [:available, :unavailable]

  def slug_candidates
    if person_id.present?
      [
        person.name,
        [person.name, dni]
      ]
    else
      nil
    end
  end

end

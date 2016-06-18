class Client < ActiveRecord::Base
  self.inheritance_column = nil
  acts_as_paranoid
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :person
  has_many :appointments
  has_many :collaborators, through: :appointments

  delegate :first_name, :last_name, :dni, :birthday, :mobile, :phone, :address, :gender, :civil_status, :email, to: :person, allow_nil: true

  enum type: [:regular, :premiun]

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

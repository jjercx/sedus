class Person < ActiveRecord::Base
  acts_as_paranoid
  self.inheritance_column = nil

  has_one :collaborator
  has_one :client

  enum gender: [:male, :female]
  enum civil_status: [:single, :married, :widower, :divorced]

  accepts_nested_attributes_for :collaborator, allow_destroy: true

  validates :first_name, :last_name, presence: true
  validates_format_of :phone, with: /\A(([ \)])[0-9]{1,3}([ \)]))?([\(][0-9]{1,3}[\)])?([0-9 \.\-]{1,9})\Z/, allow_blank: true
  validates_format_of :mobile, with: /\A([\+][0-9]{1,3}([ \.\-])?)?([\(][0-9]{1,6}[\)])?([0-9 \.\-]{1,11})\Z/, allow_blank: true

  def save_collaborator
    if collaborator.nil?
      ap self
      ap self.collaborator
      ap "nulo"
      errors.add(:collaborator,"debe ser valido.")
      prepare_collaborator
      return false
    else
      self.collaborator.password = "qwerty"
      self.save
      if self.errors.empty? and self.collaborator.errors.empty?
        self.collaborator.save
        return true
      else
        prepare_collaborator
        self.collaborator.email = self.email
        return false
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def prepare_collaborator
    _collaborator = collaborator || build_collaborator
  end

end

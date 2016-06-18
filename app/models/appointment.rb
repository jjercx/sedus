class Appointment < ActiveRecord::Base
  self.inheritance_column = nil
  acts_as_paranoid
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :collaborator
  belongs_to :client

  enum status: [:issued, :missed, :finished, :canceled]
  enum type: [:medical, :educational]

  delegate :name, to: :collaborator, prefix: true
  delegate :name, to: :client, prefix: true

  validates_presence_of :collaborator, :client

  def slug_candidates
    [
      status,
      [status, id]
    ]
  end

end

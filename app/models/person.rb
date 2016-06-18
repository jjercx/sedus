class Person < ActiveRecord::Base
  has_one :collaborator
  has_one :client
end

class Funeral < ApplicationRecord

  # validations

  validates_presence_of :burial_cremation

  # enumerables

  enum burial_cremation: [:burial, :cremation, :burial_at_sea, :viking, :dumpster, :sky_burial, :other]
  enum type_of_service: [:traditional, :military, :catholic, :jewish, :open_casket, :closed_casket]

  # relationships

  belongs_to :user

end

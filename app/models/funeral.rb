class Funeral < ApplicationRecord

  validates_presence_of :burial_cremation

  enum burial_cremation: [:burial, :cremation, :burial_at_sea, :viking, :dumpster, :sky_burial, :other]
  enum type_of_service: [:traditional, :military, :catholic, :jewish, :open_casket, :closed_casket]

end

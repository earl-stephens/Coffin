class Funeral < ApplicationRecord

  # validations

  validates_presence_of :burial_cremation

  # relationships

  belongs_to :user

end

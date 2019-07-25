class Contact < ApplicationRecord

  before_create :set_verification_token
  # validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :phone
  validates_presence_of :email

  # enumerables

  enum role: [:secondary, :primary]

  # relationships

  belongs_to :user

  private

  def set_verification_token
    self.verification_token = SecureRandom.urlsafe_base64.to_s
  end

end

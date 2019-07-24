class User < ApplicationRecord

  # validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  # relationships

  has_many :financial_accounts
  has_many :contacts
  has_one :dead_man_switch
  has_one :employer
  has_one :funeral

  # Attachments

  has_many_attached :wills
  has_many_attached :powers_of_attorney
  has_many_attached :birth_certificates
  has_many_attached :finance_records
  has_many_attached :misc_files
  has_many_attached :va_benefits
  has_many_attached :employment_info
  has_many_attached :life_insurance
  has_many_attached :ss_info
  has_many_attached :tax_info
  has_many_attached :obituary


  # last sentiments
  # Funeral docs
  # Pet Arrangments


  def find_primary_contact_email
    contact = self.contacts.where(contacts: {role: 1})
    contact[0].email
  end

end

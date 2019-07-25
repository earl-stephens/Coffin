class User < ApplicationRecord

  # validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  # relationships

  has_many :financial_accounts
  has_many :contacts
  has_one :dead_man_switch, dependent: :destroy
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
  has_many_attached :last_wishes
  has_many_attached :funeral_info
  has_many_attached :pet_info


  def find_primary_contact
    self.contacts.find_by(role: 1)
  end

  def progress
    counter = 0
    counter +=1 if wills.attachments != []
    counter +=1 if powers_of_attorney.attachments != []
    counter +=1 if birth_certificates.attachments != []
    counter +=1 if finance_records.attachments != []
    counter +=1 if misc_files.attachments != []
    counter +=1 if va_benefits.attachments != []
    counter +=1 if employment_info.attachments != []
    counter +=1 if life_insurance.attachments != []
    counter +=1 if ss_info.attachments != []
    counter +=1 if tax_info.attachments != []
    counter +=1 if obituary.attachments != []
    counter +=1 if last_wishes.attachments != []
    counter +=1 if funeral_info.attachments != []
    counter +=1 if pet_info.attachments != []
    ((counter.to_f / 14.0) * 100).round
  end
end

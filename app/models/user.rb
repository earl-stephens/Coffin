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

  has_one_attached :will
  has_many_attached :finance_records

  def find_primary_contact_email
    contact = self.contacts.where(contacts: {role: 1})
    contact[0].email
  end

end

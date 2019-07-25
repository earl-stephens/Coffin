class AddVerifiedToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :verification_token, :string
    add_column :contacts, :verified, :boolean, default: false
  end
end

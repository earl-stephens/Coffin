class CreateFinancialAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_accounts do |t|
      t.string :institution_name
      t.string :account_number
      t.bigint :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

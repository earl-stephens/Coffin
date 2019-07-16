class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :role, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

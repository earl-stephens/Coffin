class CreateEmployer < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :employer_company
      t.string :employer_contact
      t.string :phone
      t.string :email
      t.string :employee_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

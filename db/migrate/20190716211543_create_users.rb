class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.boolean :organ_donor, default: false
      t.string :place_of_birth
      t.string :maiden_name
      t.boolean :deceased, default: false

      t.timestamps
    end
  end
end

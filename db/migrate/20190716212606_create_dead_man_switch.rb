class CreateDeadManSwitch < ActiveRecord::Migration[5.2]
  def change
    create_table :dead_man_switches do |t|
      t.time :length_of_time
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end

class AddDeadManSwitchIntervalAndIntervalType < ActiveRecord::Migration[5.2]
    def change
      add_column :dead_man_switches, :interval, :integer
      add_column :dead_man_switches, :interval_type, :string
      remove_column :dead_man_switches, :length_of_time, :time
      add_column :dead_man_switches, :start_time, :time
    end
  end

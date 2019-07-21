class ChangeDeadManSwitch < ActiveRecord::Migration[5.2]
  def change
    remove_column :dead_man_switches, :start_time
    remove_column :dead_man_switches, :interval
    remove_column :dead_man_switches, :interval_type
    add_column :dead_man_switches, :interval_in_seconds, :bigint
    add_column :dead_man_switches, :one_day_message_sent, :boolean, default: false
    add_column :dead_man_switches, :one_hour_message_sent, :boolean, default: false
    add_column :dead_man_switches, :expired_message_sent, :boolean, default: false
  end
end

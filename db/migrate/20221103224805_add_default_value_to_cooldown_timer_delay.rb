class AddDefaultValueToCooldownTimerDelay < ActiveRecord::Migration[7.0]
  def change
    change_column :abilities, :cooldown_timer_delay, :integer, default: 0
  end
end

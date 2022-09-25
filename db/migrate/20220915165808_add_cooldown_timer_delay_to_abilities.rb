class AddCooldownTimerDelayToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :cooldown_timer_delay, :integer
  end
end

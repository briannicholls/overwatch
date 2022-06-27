class AddStunDurationToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :stun_duration, :integer
  end
end

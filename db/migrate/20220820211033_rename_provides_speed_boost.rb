class RenameProvidesSpeedBoost < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :provides_speed_boost, :applies_speed_boost_self
    add_column :abilities, :applies_apeed_boost_target, :boolean
  end
end

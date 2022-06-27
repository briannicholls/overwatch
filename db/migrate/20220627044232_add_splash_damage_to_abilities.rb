class AddSplashDamageToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_splash_damage, :boolean, default: false
    add_column :abilities, :splash_radius, :float
  end
end

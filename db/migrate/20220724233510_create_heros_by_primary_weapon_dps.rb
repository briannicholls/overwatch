class CreateHerosByPrimaryWeaponDps < ActiveRecord::Migration[7.0]
  def change
    create_view :heros_by_primary_weapon_dps
  end
end

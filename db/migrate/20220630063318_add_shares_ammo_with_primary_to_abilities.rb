class AddSharesAmmoWithPrimaryToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :shares_ammo_with_primary, :boolean
  end
end

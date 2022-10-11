class AddCanDamageSelfToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :inflicts_self_damage, :boolean
  end
end

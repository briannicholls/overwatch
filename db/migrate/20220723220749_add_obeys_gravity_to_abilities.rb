class AddObeysGravityToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :obeys_gravity, :boolean
  end
end

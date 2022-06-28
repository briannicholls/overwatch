class AddIsBarrierToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_barrier, :boolean
  end
end

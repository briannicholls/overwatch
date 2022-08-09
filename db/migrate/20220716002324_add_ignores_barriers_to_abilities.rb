class AddIgnoresBarriersToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :ignores_barriers, :boolean, default: false
  end
end

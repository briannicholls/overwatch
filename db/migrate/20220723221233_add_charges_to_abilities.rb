class AddChargesToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :charges, :integer
  end
end

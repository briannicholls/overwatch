class AddTimeToChargeToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :time_to_charge, :integer
  end
end

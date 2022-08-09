class RenameTimeToCharge < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :time_to_charge, :single_charge_regeneration_duration
  end
end

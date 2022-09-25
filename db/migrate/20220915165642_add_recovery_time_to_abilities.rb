class AddRecoveryTimeToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :recovery_time, :integer
  end
end

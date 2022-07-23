class AddRecoveryRateToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :recovery_rate, :integer
  end
end

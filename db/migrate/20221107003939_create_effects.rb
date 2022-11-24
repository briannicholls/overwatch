class CreateEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :effects do |t|
      t.references :ability, null: false, foreign_key: true
      t.string :effect_type
      t.integer :duration
      t.integer :amount_per_second
      t.float :percent_change
      t.string :target

      t.timestamps
    end
  end
end

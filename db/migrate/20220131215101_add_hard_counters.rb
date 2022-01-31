class AddHardCounters < ActiveRecord::Migration[7.0]
  def change
    create_table :hard_counters do |t|
      t.references :advantage_hero, foreign_key: {to_table: :heros}, null: false
      t.references :disadvantage_hero, foreign_key: {to_table: :heros}, null: false
      t.timestamps
    end
  end
end

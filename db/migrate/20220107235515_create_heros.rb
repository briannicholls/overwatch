class CreateHeros < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.references :role, null: false, foreign_key: true
      t.references :advantage_hero, foreign_key: {to_table: :heros}
      t.timestamps
    end
  end
end

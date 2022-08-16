class CreateSystemSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :system_settings do |t|
      t.string :name
      t.string :encrypted_value

      t.timestamps
    end
  end
end

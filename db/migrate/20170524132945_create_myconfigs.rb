class CreateMyconfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :myconfigs do |t|
      t.integer :singleton_guard, null: false, default: 0
      t.boolean :global_lock,     null: false, default: false

      t.timestamps
    end
    add_index :myconfigs, :singleton_guard, unique: true
  end
end

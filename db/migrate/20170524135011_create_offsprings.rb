class CreateOffsprings < ActiveRecord::Migration[5.1]
  def change
    create_table :offsprings do |t|
      t.string     :first_name, null: false
      t.string     :last_name,  null: false
      t.integer    :grade
      t.integer    :age
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.boolean :heliskiing
      t.boolean :pickle
      t.boolean :walnut
      t.date :birthday
      t.string :planet
      t.text :comments
      t.boolean :spam

      t.timestamps
    end
  end
end

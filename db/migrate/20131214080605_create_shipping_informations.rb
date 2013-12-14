class CreateShippingInformations < ActiveRecord::Migration
  def change
    create_table :shipping_informations do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end

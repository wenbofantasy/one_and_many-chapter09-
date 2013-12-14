class CreateBillingInformations < ActiveRecord::Migration
  def change
    create_table :billing_informations do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :payment_method
      t.string :card_number
      t.string :expiration_date
      t.boolean :same_as_shipping_information

      t.timestamps
    end
  end
end

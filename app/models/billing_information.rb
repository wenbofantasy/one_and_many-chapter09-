class BillingInformation < ActiveRecord::Base
  attr_accessible :address, :card_number, :city, :country, :expiration_date, :name, :payment_method, :postal_code, :same_as_shipping_information, :state, :user_id

  belongs_to :user
end

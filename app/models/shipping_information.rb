class ShippingInformation < ActiveRecord::Base
  attr_accessible :address, :city, :country, :name, :postal_code, :state, :user_id
end

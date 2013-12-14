class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:profile, :dashboard, :order]

  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user 
      flash[:success] = "Welcome !"  
      redirect_to dashboard_url
    else
      flash[:error] = @user.error_messages
      render :new
    end
  end

  def profile
    @billing_information = current_user.billing_information || BillingInformation.new
    @shipping_information = current_user.shipping_information || ShippingInformation.new
  end

  def dashboard
    render :process
  end

  def test
    render :text => "session user id: #{session[:user_id]}"
  end

  def order
    begin 
      @billing_information = current_user.billing_information
      if @billing_information.present?
        @billing_information.update_attributes(params[:billing_information]) 
      else
        current_user.create_billing_information(params[:billing_information])
      end
      @shipping_information = current_user.shipping_information
      if @shipping_information.present?
        @shipping_information.update_attributes(params[:shipping_information])
      else
        current_user.create_shipping_information(params[:shipping_information])
      end
      flash[:success] = "Information Saved!"  
      render :process
    rescue => e
      flash[:error] = "ERROR"
      render :text => e.messages
    end
  end
end

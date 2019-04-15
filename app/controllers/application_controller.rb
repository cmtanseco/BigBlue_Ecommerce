class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :load_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :phone, :address, :city, :province_id, :postal_code)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :current_password, :phone, :address, :city, :province_id, :postal_code)}
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    # @cart = Product.find(session[:cart])
    @cart = []
    session[:subtotal] = 0
    session[:cart].each do |item|
      @cart << Product.find(item['id'])
      current_price = Product.find(item['id']).price * item['stock']
      session[:subtotal] += current_price
    end
  end
end
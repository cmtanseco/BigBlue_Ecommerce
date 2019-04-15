class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :DESC).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    stock = params[:stock].to_i
    # session[:cart] << { 'id' => id }

    if session[:cart].count.zero? && stock.positive?
      session[:cart] << { 'id' => id, 'stock' => 1 }
    else
      session[:cart] << { 'id' => id, 'stock' => 1 } unless session[:cart].any? { |item| item['id'].to_i == id }
    end
    redirect_to products_url
  end

  def clear_cart
    session[:cart] = []
    session[:subtotal] = []
    redirect_to cart_url
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete_if { |item| item['id'] == id }
    redirect_to cart_url
  end

  def update_cart
    id = params[:id].to_i
    stock = params[:stock].to_i
    session[:cart].each do |item|
      item['stock'] = stock if item['id'].to_i == id
    end
    redirect_to cart_url
  end
end

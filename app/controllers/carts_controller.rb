class CartsController < ApplicationController
  def index
    # reset_session
    save_session_to_cart if session.key? :cart
  end

  def add
    session[:cart] ||= {}
    session[:cart][params[:id]] = 1 unless session[:cart].key? params[:id]
    save_session_to_cart

    render :index
  end

  def delete
    session[:cart].delete params[:id]
    redirect_to carts_index_path
  end

  def destroy
    reset_session
    render :index
  end

  private

  def save_session_to_cart
    @cart = []
    @total = 0
    session[:cart].each do |product_id, quantity|
      @cart << [Product.find(product_id), quantity]
      @total += Product.find(product_id).price * quantity
    end
    @cart
  end
end

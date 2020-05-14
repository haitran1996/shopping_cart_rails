# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    # reset_session
    save_session_to_cart if session.key? :cart
  end

  def add
    session[:cart] ||= {}
    session[:cart][params[:id]] = 1 unless session[:cart].key? params[:id]
    save_session_to_cart

    redirect_to carts_index_path
  end

  def delete
    session[:cart].delete params[:id]
    redirect_to carts_index_path
  end

  def destroy
    reset_session
    redirect_to carts_index_path
  end

  def increment_item
    session[:cart][params[:id]] += 1
    save_session_to_cart
    redirect_to carts_index_path
  end

  def decrement_item
    session[:cart][params[:id]] -= 1 if session[:cart][params[:id]] > 1
    save_session_to_cart
    redirect_to carts_index_path
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

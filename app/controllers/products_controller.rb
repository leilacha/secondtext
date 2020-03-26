# frozen_string_literal: true

# controller for Product
class ProductsController < ApplicationController
  # before_action :authenticate_user!

  def books
  	@section = Section.find_by(name: 'Livres')
    @categories = Product::BOOK_CATEGORIES
  	@products = Product.where(section_id: @section.id)
    @products = filter_and_sort(@products, params[:category], params[:sort_elem])
  end

  def movies
    @section = Section.find_by(name: 'Films')
    @categories = Product::MOVIE_CATEGORIES
    @products = Product.where(section_id: @section.id)
    @products = filter_and_sort(@products, params[:category], params[:sort_elem])
  end

  def show
  	@product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
  end

  def like
    current_user.likes.create(product_id: params[:id])
    @product = Product.find(params[:id])
    @user = current_user
    @liked = true
    respond_to :js
  end

  def unlike
    current_user.likes.where(product_id: params[:id]).destroy_all
    @product = Product.find(params[:id])
    @liked = false
    respond_to :js
  end

  def comment
    @comment = current_user.comments.create(product_id: params[:id], body: params[:body])
    @product = Product.find(params[:id])
    @user = current_user
    respond_to :js
  end

  private

  def filter_and_sort(products, category, sort_elem)
    filtered_products = filter_category(products, category)
    return filtered_products.sort_by_total_likes unless sort_elem
    sorted_products = sort_product(filtered_products, sort_elem)
    sorted_products
  end

  def filter_category(products, category)
    return products if category.blank? || category == 'Tout'
    products.where(category: category)    
  end

  def sort_product(products, sort_elem)
    return products.sort_by_total_likes unless Product::SORTING_ELEMS.keys.include?(sort_elem.to_sym)
    products.send(sort_elem)
  end
end

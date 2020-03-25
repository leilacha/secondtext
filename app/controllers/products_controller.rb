# frozen_string_literal: true

# controller for Product
class ProductsController < ApplicationController
  # before_action :authenticate_user!

  def books
  	books = Section.find_by(name: 'Livres')
    @categories = Product::BOOK_CATEGORIES
  	@products = Product.where(section_id: books.id)
    @products = sort_by_cat(@products, params[:category])
  end

  def movies
    movies = Section.find_by(name: 'Films')
    @categories = Product::MOVIE_CATEGORIES
    @products = Product.where(section_id: movies.id)
    @products = sort_by_cat(@products, params[:category])
  end

  def show
  	@product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
  end

  private

  def sort_by_cat(products, category)
    return products if category.blank? || category == 'Tout'
    products.where(category: category)
  end
end

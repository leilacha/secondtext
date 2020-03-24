# frozen_string_literal: true

# controller for Product
class ProductsController < ApplicationController
  def books
  	books = Section.find_by(name: 'Livres')
    @categories = Product::BOOK_CATEGORIES
  	@products = Product.where(section_id: books.id)
  end

  def movies
    movies = Section.find_by(name: 'Films')
    @categories = Product::MOVIE_CATEGORIES
    @products = Product.where(section_id: movies.id)
  end

  def show
  	@product = Product.find(params[:id])
  end

  def destroy
    @product.destroy
  end
end

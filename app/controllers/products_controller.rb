# frozen_string_literal: true

# controller for Product
class ProductsController < ApplicationController
  # before_action :authenticate_user!

  def books
  	@section = Section.find_by(name: 'Livres')
    @categories = @section.categories
  	@products = Product.where(section_id: @section.id).published
    @products = filter_and_sort(@products, params[:category], params[:sort_elem])
  end

  def movies
    @section = Section.find_by(name: 'Films')
    @categories = @section.categories
    @products = Product.where(section_id: @section.id).published
    @products = filter_and_sort(@products, params[:category], params[:sort_elem])
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
    @sections = Section.active
  end

  def create
    complete_product_params = fetch_author_params(product_params)
    @product = Product.new(complete_product_params)
    if @product.save
      @errors = false
    else
      @errors = @product.errors.messages.map do |item, error|
        next if error == ['must exist']
        error.last
      end.compact.join(', ')
    end
    respond_to :js
  end
 
  def edit
    @product = Product.find(params[:id])
    @section = Section.find(@product.section.id)
    @categories = @section.categories
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to validate_path
    else
      @errors = @product.errors.messages.map do |item, error|
        next if error == ['must exist']
        error.last
      end.compact.join(', ')
    end
    respond_to :js
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

  def select_section
    @section = Section.find_by(code: params[:section])
    @new_product = Product.new
    @new_comment = @new_product.comments.build
    respond_to :js
  end

  def validate
    @products = Product.created
  end

  private
  def product_params
    params.require(:product).permit(:title, :release_year, :description, :category, :status,
      :section_id, :author_id, comments_attributes: [:id, :user_id, :product_id, :body, :_destroy])
  end

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

  def fetch_author_params(params)
    return params if params[:author_id].to_i != 0
    if params[:author_id].blank?
      params[:author_id] = nil
    else
      new_author = Author.create(name: params[:author_id], bio: 'À compléter')
      params[:author_id] = new_author.id
    end
    params
  end
end

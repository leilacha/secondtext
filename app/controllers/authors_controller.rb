# frozen_string_literal: true

# controller for Author
class AuthorsController < ApplicationController

  def show
  	@author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to validate_path
    else
      @errors = @author.errors.messages.map do |item, error|
        next if error == ['must exist']
        error.last
      end.compact.join(', ')
    end
    respond_to :js
  end

  private
  def author_params
    params.require(:author).permit(:name, :bio)
  end
end

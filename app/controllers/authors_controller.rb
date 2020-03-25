# frozen_string_literal: true

# controller for Author
class AuthorsController < ApplicationController

  def show
  	@author = Author.find(params[:id])
  end
end

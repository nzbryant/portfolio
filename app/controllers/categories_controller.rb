class CategoriesController < ApplicationController
  
  def show	
	@category = Category.find(params[:id]) # To show a specific user, we must first find that user. Returns show.html.erb.
  end
end

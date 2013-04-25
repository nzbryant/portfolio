class CategoriesController < ApplicationController
  
  def show
  	# To show a specific user, we must first find that user. Returns show.html.erb.
	@category = Category.find(params[:id]) 
 end
end

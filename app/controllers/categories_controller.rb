class CategoriesController < ApplicationController
  
  def show
  	@category = Category.find(params[:id])
	end

	def new_quiz
		@category = Category.find(params[:id])
		@quiz = Quiz.new

		@subcategories = @category.subcategories
		 
		@subcategories.sort_by{ |e| e.name }

   end      
	
	def create_quiz
    @quiz = Quiz.new(params[:quiz]) # We create a new member from the params passed by the form
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render json: @quiz, status: :created, location: @quiz }
      else
        format.html { render action: "new" }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
   	end
 	end

end

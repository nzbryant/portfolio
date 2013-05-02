require 'csv'

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
    @quiz = Quiz.new(params[:quiz]) 
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

  def csv_upload

    @category = Category.find(params[:id])
    @quiz = Quiz.new

    Question.destroy_all
    CSV.parse(params[:file].read) do |row|  

      question = Question.new(:text => row[1])

      (1..row.length).to_a.each_with_index do |ans,idx|
        answer = Answer.new(:text => row[idx])
        question.answers << answer
        answer.save
      end
      
      question.save
      
    end
    
    redirect_to csv_view_category_path
  end

  def csv_view
    @questions = Question.all
    @answers = Answer.all
  end


  def csv_load

  end

end

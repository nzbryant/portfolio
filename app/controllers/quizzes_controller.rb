require 'csv'

class QuizzesController < ApplicationController
  
  def new
    @quiz = Quiz.new
    respond_to do |format|
        format.html 
        format.json { render json: @quiz}
    end
  end

  def show
     @quiz = Quiz.find(params[:id]) # To show a specific quiz, we must first find that quiz. Returns show.html.erb.
     @subcategory = @quiz.subcategory
  end

  def check_answers
    @quiz = Quiz.find(params[:id])
    
    @total = 0
    @ans = 0

    @quiz.questions.each do |question|
      if params[question.id.to_s]
        (@total = @total + 1) if question.answers.find(params[question.id.to_s]).is_correct
        @ans = @ans + 1
      end
    end

  end


  def csv_load
    @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
   # @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
   # @subcategory = @quiz.subcategory
   # @category = @subcategory.category
   # @subcategories = @category.subcategories

  end

  def csv_upload
    @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
    @subcategory = @quiz.subcategory
 #   @category = @subcategory.category
      
    CSV.parse(params[:file].read) do |row|  
      question = Question.new(:text => row[0])

      (1..(row.length - 1)).to_a.each do |idx|
        answer = Answer.new(:text => row[idx])
        question.answers << answer
        answer.save
      end
      
      @quiz.questions << question
      question.save     
      #@quiz.title <<
      
    end
   
    update
    #redirect_to edit_quiz_path
  end

   def edit
    @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
    @subcategory = @quiz.subcategory
    @category = @subcategory.category
    @subcategories = @category.subcategories
  end

 def csv_view
    @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
   # @subcategory = @quiz.subcategory
    #@category = @subcategory.category
  end


  def destroy
    @quiz = Quiz.find(params[:id]) # We find the specified quiz, then destroy him. Bwah ha ha ha ha ha ha ha ha ha.
    @quiz.destroy
    redirect_to root_url # This redirects to the LIST (index) page -- there is no longer a quiz to show!
  end

  def update
   # params[:quiz][:subcategory] = Subcategory.find(params[:quiz][:subcategory])
    @quiz = Quiz.find(params[:id]) # We find the specified quiz, then update the quiz's attributes
    @quiz.update_attributes(params[:quiz]) # This updates only those attributes passed in the params[:quiz] hash
    redirect_to @quiz # This redirects to the show page for this quiz (it's a shortcut)
  end

  def create
    if params[:quiz][:subcategory].present? then params[:quiz][:subcategory] = Subcategory.find(params[:quiz][:subcategory])
    end
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
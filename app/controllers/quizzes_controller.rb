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

  def edit
    @quiz = Quiz.find(params[:id]) # We find the quiz to display his data in the edit form. Returns edit.html.erb.
  end


  def destroy
    @quiz = Quiz.find(params[:id]) # We find the specified quiz, then destroy him. Bwah ha ha ha ha ha ha ha ha ha.
    @quiz.destroy
    redirect_to quizzes_url # This redirects to the LIST (index) page -- there is no longer a quiz to show!
  end

  def update
    @quiz = Quiz.find(params[:id]) # We find the specified quiz, then update the quiz's attributes
    @quiz.update_attributes(params[:quiz]) # This updates only those attributes passed in the params[:quiz] hash
    redirect_to @quiz # This redirects to the show page for this quiz (it's a shortcut)
  end

  def create
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
class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to :back
      flash[:success] = 'Вопрос успешно задан'
    else
      redirect_to :back
      flash[:danger] = 'Произошла ошибка'
    end
  end

  private

  def question_params
    params.require(:question).permit(:name, :tel, :text)
  end
end

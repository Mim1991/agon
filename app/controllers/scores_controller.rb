class ScoresController < ApplicationController
  before_action :find_course, only: [:new, :create]

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    @score.user = current_user
    @score.course = @course
    if @score.save
      redirect_to friendships_path
    else
      render :new
    end
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end
  
  def score_params
    params.require(:score).permit(:score, :shots)
  end
end

class CoursesController < ApplicationController
  before_action :course_params, only: [:create, :update]
  before_action :find_params, only: [:edit, :update, :destroy]

  def index
  	@courses = Course.all
  end

  def new
  	@course = Course.new
  end

  def create
  	@course = Course.new(course_params)
  	if @course.save
  	  redirect_to courses_path
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @course.update(course_params)
  	  redirect_to courses_path
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@course.destroy
  	redirect_to courses_path
  end

  private

    def course_params
      params.require(:course).permit(:name, :description)
    end

    def find_params
      @course = Course.find(params[:id])
    end
end

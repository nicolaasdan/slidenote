class SlidesController < ApplicationController
  before_action :slide_params, only: [:create]
  before_action :find_course, only: [:index, :create, :new]

  def index
  end

  def new
  	@slide = Slide.new
  end

  def create
  	@slide = Slide.new(slide_params)
    @slide.course_id = @course.id
    
  	if @slide.save
  	  redirect to courses_path
  	else
  	  render 'new'
  	end
  end

  private

    def slide_params
      params.require(:slide).permit(:image)
    end

    def find_course
      @course = Course.find(params[:course_id])
    end
end

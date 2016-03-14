class SlidesController < ApplicationController
  before_action :slide_params, only: [:create]
  before_action :find_course, only: [:index, :create, :new, :edit, :update, :destroy]
  before_action :find_slide, only: [:edit, :updaten, :destroy]

  def index
    @slides = Slide.all
  end

  def new
  	@slide = Slide.new
  end

  def create
  	@slide = Slide.new(slide_params)
    @slide.course_id = @course.id

  	if @slide.save
  	  redirect_to course_slides_path(@course)
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @slide.update(slide_params)
      redirect_to course_slides_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    @slide.destroy
    redirect_to course_slides_path(@course)
  end

  private

    def slide_params
      params.require(:slide).permit(:image)
    end

    def find_course
      @course = Course.find(params[:course_id])
    end

    def find_slide
      @slide = Slide.find(params[:id])
    end
end

class SlidesController < ApplicationController
  before_action :slide_params, only: [:create]
  before_action :find_course
  before_action :find_slide, only: [:edit, :update, :destroy]
  before_action :find_slides, except: [:overview]

  def index
  end

  def overview
    @slides = Slide.where(:course_id => params[:course_id])
    @number = @slides.all
    render layout: "application"
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

    def find_slides
      @slides = Slide.where(course_id: params[:course_id]).paginate(page: params[:page], per_page: 1)
    end
end

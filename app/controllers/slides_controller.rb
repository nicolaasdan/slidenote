class SlidesController < ApplicationController
  before_action :slide_params, only: [:create]
  before_action :find_course
  before_action :find_slide, only: [:edit, :update, :destroy]
  before_action :find_slides, except: [:overview]
  before_action :authenticate_user!

  def index
  end

  def overview 
    if params[:category].blank?
      @slides = Slide.where(:course_id => params[:course_id])
      @number = @slides.all
    else
      @category_id = Category.find_by(chapter: params[:category]).id
      @slides = Slide.where(:course_id => params[:course_id], :category => @category_id)
      @number = @slides.all
    end
    render layout: "application"
  end

  def new
  	@slide = Slide.new
    @categories = Category.all.map{ |c| [c.chapter, c.id] }
  end

  def create
  	@slide = Slide.new(slide_params)
    @slide.course_id = @course.id
    @slide.category_id = params[:category_id]

  	if @slide.save
  	  redirect_to course_slides_path(@course)
  	else
  	  render 'new'
  	end
  end

  def edit
    @categories = Category.all.map{ |c| [c.chapter, c.id] }
  end

  def update
    @slide.category_id = params[:category_id]
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
      params.require(:slide).permit(:image, :category_id)
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

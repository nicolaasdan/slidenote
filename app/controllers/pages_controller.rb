class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:leaderboard, :home, :admin]
  before_action :adminfunc, only: [:admininfo]
  layout 'pages'
  
  def home
    @slides = Slide.all.where("amount_of_notes > ?", 1)
    @post = Post.last
    @number = @slides.all
    @users = User.all
    @user = User.last
    @notes = Note.all
    @ary = Array.new
    @my_array = Array.new
    @usernotes = current_user.notes

    render layout: 'application'
  end

  def welcome
    render layout: 'welcome'
  end

  def aboutus
  end

  def faq
  end

  def leaderboard
  	@users = User.all
  	@user = User.last
  	@notes = Note.all
  	@ary = Array.new
  	@my_array = Array.new
    @usernotes = current_user.notes

  	render layout: 'application'  
  end

  def admininfo
    @users = User.all.order(:id => :desc)
    @notes = Note.all
    @slides = Slide.all
    @polls = Poll.all


    render layout: 'application'
  end
end


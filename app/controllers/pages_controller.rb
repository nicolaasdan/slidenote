class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:leaderboard]
  layout 'welcome'
  
  def home
    @slides = Slide.all.order(:created_at => "desc")
    @post = Post.last
    @number = Slide.all
  
    render layout: 'application'
  end

  def welcome
  end

  def aboutus
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
end


class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:leaderboard]
  layout 'welcome'
  
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


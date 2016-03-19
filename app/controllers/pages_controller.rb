class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:leaderboard]
  layout 'welcome'
  
  def welcome
  end

  def aboutus
  end

  def leaderboard
  	render layout: 'application'
  end
end

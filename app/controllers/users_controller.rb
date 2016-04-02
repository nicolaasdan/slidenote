class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = @user.email.match(@name_regex).captures
  	@first_name = first.titleize
  	@last_name = last.titleize
  end

end


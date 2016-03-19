class UsersController < ApplicationController
  def show
  	@user = current_user
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = @user.email.match(@name_regex).captures
  	@first_name = first	
  	@last_name = last
  end
end


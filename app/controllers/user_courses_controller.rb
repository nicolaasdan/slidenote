class UserCoursesController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@user_course = UserCourse.new(course_id: params[:course_id], user: current_user)
  	if @user_course.save
  	  redirect_to :back
  	else
  	  flash[:alert] ="Something went wrong, you did not enroll in course"
  	end
  end

  def destroy
  	UserCourse.destroy(params[:id])
  	redirect_to :back
  end

end

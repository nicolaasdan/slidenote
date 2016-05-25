class PollsController < ApplicationController
  before_action :poll_params, only: [:create, :new]

  def new
    @poll = current_user.polls.build
  end

  def create
  	@poll = current_user.polls.build(poll_params)
  	if @poll.save
  	  redirect_to :back
  	  flash[:alert] = "De feedback is geregisteerd"
  	else
  	  redirect_to :back
   	  flash[:alert] = "Gelieve een antwoord te selecteren"
  	end
  end

  def destroy
  	current_user.polls.last.destroy
  	redirect_to :back
  end

  private

    def poll_params
      params.require(:poll).permit(:stringanswer, :feedback, :user_id)
    end
end

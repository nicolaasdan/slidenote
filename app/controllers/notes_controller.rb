class NotesController < ApplicationController
  before_action :note_params, only:[:create]
  before_action :find_slide
  
  def index
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
  	@note.slide_id = @slide.id
  	@note.user_id = current_user.id
  	if @note.save
  	  redirect_to root_path
  	else
  	  render 'new'
  	end
  end

  private

    def note_params
      params.require(:note).permit(:comment)
    end

    def find_slide
      @slide = Slide.find(params[:slide_id])
    end
end

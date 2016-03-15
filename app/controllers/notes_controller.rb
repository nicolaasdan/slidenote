class NotesController < ApplicationController
  before_action :note_params, only:[:create]
  before_action :find_slide
  before_action :find_note, only: [:edit, :update, :destroy]
  
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

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

    def note_params
      params.require(:note).permit(:comment)
    end

    def find_slide
      @slide = Slide.find(params[:slide_id])
    end

    def find_note
      @note = @slide.notes.find(params[:id])
    end
end

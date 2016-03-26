class NotesController < ApplicationController
  before_action :note_params, only:[:create, :update]
  before_action :find_slide
  before_action :find_note, only: [:edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
  
  def index
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
  	@note.slide_id = @slide.id
  	@note.user_id = current_user.id
    if current_user.notes.where(:slide_id => @slide).size < 1
  	  if @note.save
  	    redirect_to :back
  	  else
  	    redirect_to :back
        flash[:alert] = "Please make sure your note contains between 1-140 characters"
  	  end
    else
      redirect_to :back
      flash[:alert] ="Only 1 note per slide allowed. Please adjust your existing note"
    end
  end

  def edit
    session[:return_to] ||= request.referer
  end

  def update
    if @note.update(note_params)
      redirect_to session.delete(:return_to)
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to :back
  end

  def upvote
    @note.upvote_from current_user
    if @note.vote_registered?
      @note.user.increment!(:score)
      @note.user.check_level
    end
    redirect_to :back
  end

  def downvote
    @note.downvote_from current_user
    if @note.vote_registered?
      @note.user.decrement!(:score)
      @note.user.check_level
    end
    redirect_to :back
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

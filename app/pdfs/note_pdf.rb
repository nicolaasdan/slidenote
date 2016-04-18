class NotePdf < Prawn::Document


  def initialize(course)
  	super()
  	@course = course
  	font_size(25) { text "Slidenote -- #{@course.name}" }
    move_down 20
    show_slides
  end

  def course_code
    @code_regex = /[A-Z]{3}\d{3}/
    @course_code = @course.name.match(@code_regex)
  end

  def rename_url url
    course_code
    @regex = /uploads\/slide\/image\/\d{1,4}\//
    url.sub!(@regex, "PDF/#{@course_code}/")
  end

  def show_slides
    i = 1
    @course.slides.each do |slide|
      #image open rename_url(slide.image.to_s)
      font_size(20) { text "Slide #{i}" }
      move_down 20
      show_notes(slide)
      i += 1
      #start_new_page
    end
  end

  def show_notes(slide)
    @slide = slide
    @slide.notes.order(:cached_votes_score => :desc).limit(5).each do |note|
      text note.user.first_name + " ( score: " + note.cached_votes_score.to_s + " )"
      stroke_horizontal_rule
      pad(20) { text note.comment }
    end
  end

  def first_name
    @name_regex = /^([^\.@]+)\.*([^@]*)/
    first, last = self.email.match(@name_regex).captures
    return first.titleize
  end

  #def rename_course_name course_name
    #course_name.gsub!(/\s/, "+")
  #end
end 
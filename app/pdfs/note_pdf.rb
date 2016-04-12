class NotePdf < Prawn::Document


  def initialize(course)
  	super()
  	@course = course
  	text "Slidenote -- #{@course.name}"
    #@course_name = rename_course_name(@course.name)
    #@url = "https://slidenote.s3.amazonaws.com/uploads/slide/image/48/ACF_Session_1_and_2_KM-page-011.jpg"
  	#image open (@allslides.last.image.to_s), at: [300, 100], with: 100, height: 100
    #image open ("https://slidenote.s3.amazonaws.com/PDF/PDF/ACF_Session_1_and_2_KM-page-011.jpg")
    #image open ("https://slidenote.s3.amazonaws.com/uploads/slide/image/48/ACF_Session_1_and_2_KM-page-011.jpg")
    #image open (rename_url(@url))
    #image open (@url)
    #image "#{Rails.root}/app/assets/images/slidenotelogo3.png"
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
    @course.slides.each do |slide|
      image open rename_url(slide.image.to_s)
      move_down 20
      show_notes(slide)
      start_new_page
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
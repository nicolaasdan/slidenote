class NotePdf < Prawn::Document
require "open-uri"


  def initialize(course, allslides)
  	super()
  	@course = course
  	@allslides = allslides
  	text "note #{@course.name}"
  	#image (@allslides.last.image.to_s)
  	image open("https://slidenote.s3.amazonaws.com/uploads/slide/image/43/Slide2.JPG")
  end

  def show_notes
  	@course.slides.each do |slide|
  	  text "slide"
  	  slide.notes.each do |note|
  	  	text note.comment
  	  end
  	end
  end

  def iterate_number
  	(1..10).each do |n|
  	  text n.to_s
  	end
  end

end
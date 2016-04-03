class User < ActiveRecord::Base
  acts_as_voter
  has_many :notes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :user_courses
  has_many :courses, through: :user_courses

  validates_format_of :email, with: /@ugent.be/, message: "Only @ugent.be email allowed"


  def give_user_score
    @my_array = Array.new
  	self.notes.each do |note|
  	  @my_array.push(note.score)
  	end
  	#@user_score = @my_array.sum
    self.score = @my_array.sum
  end

  def first_name
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = self.email.match(@name_regex).captures
  	return first.titleize
  end

  def last_name
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = self.email.match(@name_regex).captures
  	return last.titleize
  end

  def check_level
    if self.score >= 20
      self.update(:level => "Doctoraatstudent")
      return "label label-success"
    elsif self.score >= 10
      self.update(:level => "Laureaat")
      return "label label-warning"
    elsif self.score >= 5
      self.update(:level => "Alumnus")
      return "label label-info"
    elsif self.score >= 0
      self.update(:level => "Student")
      return "label label-default"
    elsif self.score < 0
      self.update(:level => "Student")
      return "label label-danger"
    end
  end

  def likes_per_comment
    unless self.score.nil?
      return self.score.to_f/self.notes.size.to_f
    end
  end

end

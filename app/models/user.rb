class User < ActiveRecord::Base
  acts_as_voter
  has_many :notes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def give_user_score
    @my_array = Array.new
  	self.notes.each do |note|
  	  @my_array.push(note.score)
  	end
  	@user_score = @my_array.sum
  end

  def order_users
    
  end

  def first_name
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = self.email.match(@name_regex).captures
  	return first
  end

  def last_name
  	@name_regex = /^([^\.@]+)\.*([^@]*)/
  	first, last = self.email.match(@name_regex).captures
  	return last
  end

end

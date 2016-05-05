require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, format: :email_address
	property :password_digest, Text


  validates_confirmation_of :password
  #no longer needed as called in the property section above
  #validates_presence_of :email
  #validates_format_of :email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end

require 'bcrypt'
require 'dm-validations'
require 'securerandom'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, Text
  property :token, Text, unique: true
  property :time_stamp, Time


  validates_confirmation_of :password
  #no longer needed as called in the property section above?
  #validates_presence_of :email
  #validates_format_of :email, :as => :email_address
  #validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, attempted_password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == attempted_password
      user
    else
      nil
    end
  end

  def generate_token
    self.time_stamp = Time.now
    self.token = SecureRandom.hex
    self.save
  end

end

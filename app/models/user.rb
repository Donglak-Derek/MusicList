class User < ActiveRecord::Base
  has_secure_password

  has_many :songs
  has_many :adds
  has_many :songs_adding , through: :adds, source: :song


  validates :first_name, :last_name, :email, presence: true

  def full_name
  	"#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end

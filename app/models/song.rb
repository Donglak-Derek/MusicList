class Song < ActiveRecord::Base
	has_many :adds
	has_many :users, through: :adds

	validates :title, :artist, presence: true
end

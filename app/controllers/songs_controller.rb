class SongsController < ApplicationController

  def index
  	@songs = Song.all
  end

  def create
  	new_song = Song.create(title: params[:title], artist: params[:artist])
  	Add.create(user:current_user, song:new_song)
    
  	if new_song.valid?
  		redirect_to :back
  	else
  		redirect_to :back, alert: new_song.errors.full_messages
  	end
  end

  def show
  	@song = Song.find_by(id: params[:id])
  	@adds = Add.where(song_id: @song.id)
    
    users = []
    ids = []
    @adds.each do |i|
      users << User.find_by(id: i.user_id).first_name
      ids << User.find_by(id: i.user_id).id
    end

    @users = users.uniq
    @ids = ids.uniq
    puts @ids
  end

  def add
    this_song = Song.find_by(id: params[:id])
  	add = Add.create(user: current_user, song: this_song)

    @counts = Add.where(song_id: this_song.id).count
    puts @counts, "*******************************"
    # Song.find_by(id: this_song.id).update(count: @counts)
  	redirect_to :back
  end

end











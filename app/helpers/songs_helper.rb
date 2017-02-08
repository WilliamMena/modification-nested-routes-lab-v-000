module SongsHelper
  def artist_select(song, artist)
    if song.artist.nil?
      #i need to display the artist name if they are editing through the nested route
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)

    elsif !artist.nil?
      "Artist: #{artist.name}"
    else
      hidden_field_tag "song[artist_id]", song.artist_id
    end
  end

end

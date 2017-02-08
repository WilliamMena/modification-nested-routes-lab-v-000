module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    if song.artist.nil?
      #i need to display the artist name if they are editing through the nested route
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)

    elsif @nested
      "Artist: #{song.artist.name}"
    else
      hidden_field_tag "song[artist_id]", song.artist_id
    end
  end
end

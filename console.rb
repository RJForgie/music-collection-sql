require('pry-byebug')
require_relative('models/artists')
require_relative('models/albums')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'The Rolling Stones'})
artist2 = Artist.new({'name' => 'Metallica'})
artist3 = Artist.new({'name' => 'Bob Dylan'})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Exile on Main Street',
  'genre' => 'Rock n Roll'
  })

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Ride the Lightning',
  'genre' => 'Metal'
  })

album3 = Album.new({
  'artist_id' => artist3.id,
  'title' => 'Highway 61 Revisited',
  'genre' => 'Folk'
  })

  album1.save
  album2.save
  album3.save

binding.pry
nil

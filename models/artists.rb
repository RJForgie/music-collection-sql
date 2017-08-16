require_relative('../db/sql_runner')

class Artist

  attr_accessor(:name)
  attr_reader(:id)

  def initialize(params)
    @id = params['id'].to_i() if params['id']
    @name = params['name']
  end

  def save()
    sql = 'INSERT INTO artists (
      name
      ) VALUES (
      $1
      )
      RETURNING *;'
    returned_data = SqlRunner.run(sql, [@name])
    returned_hash = returned_data[0]
    id = returned_hash['id']
    @id = id.to_i()
  end

  def Artist.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

  def Artist.all()
    sql = 'SELECT * FROM artists;'
    results = SqlRunner.run(sql)
    artists = results.map {|artist_hash| Artist.new(artist_hash)}
    return artists
  end

  def albums
    @id
    sql = '
      SELECT * FROM albums
      WHERE artist_id = $1;'
    album_hashes = SqlRunner.run(sql, [@id])
    albums = album_hashes.map do |album_hash|
      Album.new(album_hash)
    end
    return albums
  end

  def update(change)
    sql = '
      UPDATE artists SET (
      name
      ) = (
      $1
      )
      WHERE id = $2;'
      values = [change, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM artists WHERE id = $1;'
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

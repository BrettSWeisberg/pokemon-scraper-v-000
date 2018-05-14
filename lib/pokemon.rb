class Pokemon

  attr_accessor :name, :type, :db

  @@all = []

  def iniitalize(name, type, Scraper.db)
    @name = name
    @type = type
    @db = Scraper.db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db, database_connection)
    database_connection.execute("INSERT INTO pokemon(name,type,db) VALUES (?,?,?)",name,type,db)
  end
end

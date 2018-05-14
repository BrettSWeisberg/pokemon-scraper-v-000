class Pokemon

  attr_accessor :name, :type, :db

  @@all = []

  def iniitalize(name, type, db)
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_table
    sql =  <<-SQL
    CREATE TABLE IF NOT EXISTS pokemon(
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
    )
    SQL
    DB[:conn].execute(sql)
  end


  def save
    sql =  <<-SQL
    INSERT INTO pokemon(name,type)
    VALUES (?,?)
    SQL

    DB[:conn].execute(sql,self.name,self.type)
  end
  
end

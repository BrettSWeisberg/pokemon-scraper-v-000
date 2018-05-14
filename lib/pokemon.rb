class Pokemon

  attr_accessor :name, :type, :db, :id

  

  def iniitalize(name, type, id= nil, db)
    @name = name
    @type = type
    @db = db
    @id = id
    Pokemon.save
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

    @id = DB[:conn].execute("SELECT last_inserted() FROM pokemon")[0][0]
  end

end

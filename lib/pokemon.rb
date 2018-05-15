class Pokemon

  attr_accessor :name, :type, :db, :id



  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    #Pokemon.save
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


  def self.save (name, type, db)
    sql =  <<-SQL
    INSERT INTO pokemon(name,type)
    VALUES (?,?)
    SQL

    db.execute(sql,name,type)

  #  @id = DB[:conn].execute("SELECT last_inserted() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql =  <<-SQL
    SELECT name FROM db WHERE id = ?
    SQL
  end

end

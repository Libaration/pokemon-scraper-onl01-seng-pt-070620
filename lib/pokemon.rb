class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon (name,type)
    VALUES (?,?)
    SQL
    db.execute(sql,name,type)
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id IS ?
    SQL
    selected = db.execute(sql, id).flatten
    self.new(id: selected[0], name: selected[1], type: selected[2], db: db)
  end

  def self.find_type(type,db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE type IS ?
    SQL
    db.execute(sql,type)
  end


end

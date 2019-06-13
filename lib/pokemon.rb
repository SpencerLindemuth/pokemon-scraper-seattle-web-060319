require 'pry'

class Pokemon

    attr_accessor :name, :type, :db, :id, :hp

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        data = db.execute(sql, id).flatten
        # binding.pry
        self.new(id: data[0], name: data[1], type: data[2], hp: data[3], db: db)
    end

    def alter_hp(new_hp, db)
      # binding.pry
        sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
        db.execute(sql, new_hp, self.id)
    end




end

require_relative 'Magazine.rb'
require_relative 'Books.rb'

class LibraryManager
    attr_accessor :magazines
    
    def initialize()
        updateMagazines()
    end

    def addMagazine(title, price, publisher_agent, date)
        new_magazine = Magazine.new(title,price,publisher_agent,date)
        new_magazine.addToDB
        updateMagazines()
    end

    def getMagazinesByDate(date)
        return @magazines.select {|e| e.date == date}
    end
    
    def deleteMagazine(title)
        magazine = @magazines.select {|e| e.title == title}
        if magazine.length == 0
            return "error"
        else
            magazine[0].delete
            updateMagazines()
        end
    end

    def updateMagazines()
        file = File.open("Magazine.txt")
        file_data = file.readlines.map(&:chomp)
        @magazines = []
        file_data.each{|e|
            if e != ""
                magazineArr = e.split(",")
                magazine = Magazine.new(magazineArr[0], magazineArr[1], magazineArr[2], magazineArr[3])
                @magazines.push(magazine)
            end
        }
        file.close
    end
end

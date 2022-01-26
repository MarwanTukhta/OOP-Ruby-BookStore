require_relative 'Magazine.rb'


class LibraryManager
    def addMagazine(title, price, publisher_agent, date)
        magazinee = Magazine.new(title,price,publisher_agent,date)
        magazinee.addToDB
    end

    def getMagazinesByDate(date)
        file = File.open("Magazine.txt")
        file_data = file.readlines.map(&:chomp)
        magazines = []
        file_data.each{|e|
            if e != ""
                magazineArr = e.split(",")
                magazine = Hash.new()
                magazine["title"] = magazineArr[0]
                magazine["price"] = magazineArr[1]
                magazine["publisher-agent"] = magazineArr[2]
                magazine["date"] = magazineArr[3]
                magazines.push(magazine)
            end
        }
        return magazines.select {|e| e["date"] == date}
    end
    
end
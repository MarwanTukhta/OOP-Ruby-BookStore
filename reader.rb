require_relative 'Magazine.rb'

magazinee = Magazine.new('eLearnC','500','ACMC','11-1-2021')


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

file.close

require_relative 'Magazine.rb'
require_relative 'Books.rb'

class LibraryManager
    def addMagazine(title, price, publisher_agent, date)
        magazinee = Magazine.new(title,price,publisher_agent,date)
        magazinee.addToDB
    end

    def addBooks(title,price,author_name,number_of_pages,isbn)
        books = Books.new(title,price,author_name,number_of_pages,isbn)
        books.addToDB
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

    def range(from,to)
        
        file = File.open("Books.txt")
        file_price = file.readlines.map(&:chomp)
        books = []
        file_price.each{|e|
            if e != ""
                booksArr = e.split(",")
                books = Hash.new()
                books["title"] = booksArr[0]
                books["price"] = booksArr[1]
                books["author_name"] = booksArr[2]
                books["number_of_pages"] = booksArr[3]
                books["isbn"] = booksArr[4]
                books.push(books)
            end
        }
        return books.select { e["price"].between?(from,to) }

        def max(price)
        
            file = File.open("Books.txt")
            file_price = file.readlines.map(&:chomp)
            books = []
            file_price.each{|e|
                if e != ""
                    booksArr = e.split(",")
                    books = Hash.new()
                    books["title"] = booksArr[0]
                    books["price"] = booksArr[1]
                    books["author_name"] = booksArr[2]
                    books["number_of_pages"] = booksArr[3]
                    books["isbn"] = booksArr[4]
                    books.push(books)
                end
            }
            return books.select { e["price"].max()}
        end

        def deleteBooks(title,price,author_name,number_of_pages,isbn)
            books = Books.new(title,price,author_name,number_of_pages,isbn)
            books.delete()
        end

        def listBooks(title,price,author_name,number_of_pages,isbn)
            books = Books.new(title,price,author_name,number_of_pages,isbn)
            books.to_s()
        end

end
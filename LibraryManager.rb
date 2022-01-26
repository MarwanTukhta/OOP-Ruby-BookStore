require_relative 'Magazine.rb'
require_relative 'Books.rb'

class LibraryManager
    attr_accessor :magazines
    attr_accessor :books
    
    def initialize()
        updateMagazines()
        updateBooks()
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

    def addBooks(title, price, author_name, number_of_pages, isbn)
        new_books = Books.new(title,price,publisher_agent,date)
        new_books.addToDB
        updateBooks()
    end

    def updateBooks()
        file = File.open("Books.txt")
        file_data = file.readlines.map(&:chomp)
        @books = []
        file_data.each{|e|
            if e != ""
                booksArr = e.split(",")
                books = Books.new(booksArr[0], booksArr[1], booksArr[2], booksArr[3])
                @books.push(books)
            end
        }
        file.close
    end
    def deleteBook(title)
        book = @book.select {|e| e.title == title}
        if book.length == 0
            return "error"
        else
            book[0].delete
            updateBook()
        end
    end
    
    
    def mostExpensiveBook(price)

        return @books.select { e["price"].max()}
    end

    def range(from,to)
            
        return @books.select { e["price"].between?(from,to) }
    end
        
     
end 
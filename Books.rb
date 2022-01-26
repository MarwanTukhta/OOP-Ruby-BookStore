require 'Book_store.rb'
require 'fileutils'
class Books < Storeitem
  attr_accessor :author_name,:number_of_pages,:isbn

  def initilize(title,price,author_name,number_of_pages,isbn)
    @title = title
    @price = price
    super(title,price)
    @author_name = author_name
    @number_of_pages = number_of_pages
    @isbn = isbn  
  end

  def getbooks()
    books = {1:{title: "Ruby Cookbook", price: "100", author_name: "Lucas Carlson", number_of_pages: "400", isbn: "9780596523695"},
             2:{title: "Ruby programming", price: "90", author_name: "Jerry Lee", number_of_pages: "200", isbn: "1730497513499"},
             3:{title: "Intro to Ruby", price: "80", author_name: "John Elder", number_of_pages: "550", isbn: "1284396855669"}
   }
  end

  def deleteBooks()
    open('Books.txt', 'r') do |f|
      open('Books.txt.tmp', 'w') do |f2|
        f.each_line do |line|
           f2.write(line) unless line.start_with? @title
          end
        end
    end

    FileUtils.mv 'Books.txt.tmp', 'Books.txt'
  end

end
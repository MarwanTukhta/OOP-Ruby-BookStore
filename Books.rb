require_relative 'Book_store.rb'

class Books < Storeitem
  attr_accessor :author_name,:number_of_pages,:isbn

  def initialize(title,price,author_name,number_of_pages,isbn)
      super(title,price)
      @author_name = author_name
      @number_of_pages = number_of_pages
      @isbn = isbn    
  end

  def getbooks()
       books = {1:{title: "Ruby Cookbook", price: "100.3", author_name: "Lucas Carlson", pages: "400", isbn: "9780596523695" },
                2:{title: "Ruby programming", price: "90", author_name: "Jerry Lee", pages: "200", isbn: "1730497513499" },
                3:{title: "Intro to Ruby", price: "80", author_name: "John Elder", pages: "550", isbn: "1284396855669"}
      }
  end
end
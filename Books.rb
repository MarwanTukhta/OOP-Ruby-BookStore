require_relative 'Book_store.rb'
require 'fileutils'
class Books < Storeitem
  attr_accessor :author_name,:number_of_pages,:isbn

  def initialize(title,price,author_name,number_of_pages,isbn)
    super(title,price)
    @author_name = author_name
    @number_of_pages = number_of_pages
    @isbn = isbn  
  end

  

  def delete()
    open('Books.txt', 'r') do |f|
      open('Books.txt.tmp', 'w') do |f2|
        f.each_line do |line|
           f2.write(line) unless line.start_with? @title
          end
        end
    end

    FileUtils.mv 'Books.txt.tmp', 'Books.txt'
  end

  def addToDB()
    File.open('Books.txt', 'a') do |file|
      file.write "\n#{title},#{price},#{author_name},#{number_of_pages},#{isbn}"
    end    
  end

  def to_s()
    "Title: #{title}, Price: #{price}, Author_name: #{author_name}, Number_of_pages: #{number_of_pages}, ISBN: #{isbn}"
  end

end
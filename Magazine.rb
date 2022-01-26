require_relative 'Book_store.rb'
require 'fileutils'

class Magazine < Storeitem
    attr_accessor :publisher_agent,:date

    def initialize(title,price,publisher_agent,date)
      super(title,price)
      @publisher_agent = publisher_agent
      @date = date 
    end
    
    def delete()
      open('Magazine.txt', 'r') do |f|
        open('Magazine.txt.tmp', 'w') do |f2|
          f.each_line do |line|
             f2.write(line) unless line.start_with? @title
            end
          end
      end
      FileUtils.mv 'Magazine.txt.tmp', 'Magazine.txt'
    end

    def addToDB()
      File.open('Magazine.txt', 'a') do |file|
        file.write "\n#{title},#{price},#{publisher_agent},#{date}"
      end    
    end

    def to_s()
      "Title: #{title}, Price: #{price}, Publisher Agent: #{publisher_agent}, Date: #{date}"
    end

   end
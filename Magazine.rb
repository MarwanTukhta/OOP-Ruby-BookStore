require 'Book_store.rb'
require 'fileutils'

class Magazine < Storeitem
  attr_accessor :publisher_agent,:date

    def initilize(title,price,publisher_agent,date)
      super(title,price)
      @publisher_agent = publisher_agent
      @date = date   
    end
    
    def deleteMagazine()
      open('Magazine.txt', 'r') do |f|
        open('Magazine.txt.tmp', 'w') do |f2|
          f.each_line do |line|
             f2.write(line) unless line.start_with? @title
            end
          end
      end
        
      FileUtils.mv 'Magazine.txt.tmp', 'Magazine.txt'
    end

   end
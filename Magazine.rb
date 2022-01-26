class Magazine
    def initilize(title,price,publisher_agent,date)
      @title = title
      @price = price
      @publisher_agent = publisher_agent
      @date = date   
    end
     def getmagazine()
       magazine = {1:{title: "Software Magazine", price: "13", publisher_agent: "IEEE", date: "20-1-2022" },
                2:{title: "Communications of the ACM", price: "80", publisher_agent: "ACM", date: "14-6-2021" },
                3:{title: "eLearn", price: "50", publisher_agent: "ACM", date: "12-1-2021" }
      }
     end
   end
require_relative 'LibraryManager.rb'
require 'flammarion'

libraryManager = LibraryManager.new

f = Flammarion::Engraving.new
f.puts "Book Store"
f.puts "---------------------"

f.button("Add Store Item") {
    addItem = Flammarion::Engraving.new
    addItem.puts "Add Item"

    addItem.button("Add Book") {
        addBook = Flammarion::Engraving.new
        addBook.puts "Add Book"
        title = ""
        price = ""
        author = ""
        pages = ""
        isbn = ""
        addBook.input("Title") {|msg| title = msg['text']}
        addBook.input("Price") {|msg| price = msg['text']}
        addBook.input("Author Name") {|msg| author = msg['text']}
        addBook.input("Number of Pages") {|msg| pages = msg['text']}
        addBook.input("ISBN") {|msg| isbn = msg['text']}

        addBook.button("Add Book") {
            libraryManager.addBooks(title, price, author, pages, isbn)
            addBook.puts "The Book #{title} has been added"
        }

    }
    addItem.button("Add Magazine") {
        addMagazine = Flammarion::Engraving.new
        addMagazine.puts "Add Magazine"
        title = ""
        price = ""
        publisher = ""
        date = ""
        addMagazine.input("Title") {|msg| title = msg['text']}
        addMagazine.input("Price") {|msg| price = msg['text']}
        addMagazine.input("Publisher") {|msg| publisher = msg['text']}
        addMagazine.input("Date (dd-mm-yyyy)") {|msg| date = msg['text']}

        addMagazine.button("Add Magazine") {
            libraryManager.addMagazine(title, price, publisher, date)
            addMagazine.puts "The Magazine #{title} has been added"
        }

    }

}


f.button("List Most Expensive Items") {
    itemList = Flammarion::Engraving.new
    itemList.puts "List Most Expensive Items"
    itemList.puts "-----------------------"
    itemList.puts "Books"
    libraryManager.mostExpensiveBook().each {|e| itemList.puts e.to_s}
    itemList.puts "-----------------------"
    itemList.puts "Magazines"
    libraryManager.mostExpensiveMagazine().each {|e| itemList.puts e.to_s}
}


f.button("List Books within Certain Range") {
    bookRange = Flammarion::Engraving.new
    bookRange.puts "List Books within Certain Range"
    from = ""
    to = ""
    bookRange.input("From") {|msg| from = msg['text']}
    bookRange.input("To") {|msg| to = msg['text']}
    
    bookRange.button("Search") {
        books = libraryManager.range(from,to)
        books.each {|e| 
            bookRange.pane("bookRangePane").puts(e.to_s)
        }
    }

}


f.button("Search Magazine By Date") {
    magazineDate = Flammarion::Engraving.new
    magazineDate.puts "Search Magazine By Date"
    date = ""
    magazineDate.input("Date (dd-mm-yyyy)") {|msg| date = msg['text']}
    
    magazineDate.button("Search") {
        magazines = libraryManager.getMagazinesByDate(date)
        magazines.each {|e| 
            magazineDate.pane("magazineDatePane").puts(e.to_s)
        }
    }
}


f.button("Search Magazine By Publisher") {
    magazinePublisher = Flammarion::Engraving.new
    magazinePublisher.puts "Search Magazine By Publisher"
    publisher = ""
    magazinePublisher.input("Publisher Name") {|msg| publisher = msg['text']}
    
    magazinePublisher.button("Search") {
        magazines = libraryManager.getMagazinesByPublisher(publisher)
        magazines.each {|e| 
            magazinePublisher.pane("magazinePublisherPane").puts(e.to_s)
        }
    }
}


f.button("List Of all store Items") {
    itemList = Flammarion::Engraving.new
    itemList.puts "List Of all store Items"
    itemList.puts "-----------------------"
    itemList.puts "Books"
    libraryManager.books.each {|e| itemList.puts e.to_s}
    itemList.puts "-----------------------"
    itemList.puts "Magazines"
    libraryManager.magazines.each {|e| itemList.puts e.to_s}
}


f.button("Delete An Item") {
    deleteItem = Flammarion::Engraving.new
    deleteItem.puts "Delete Item"

    deleteItem.button("Delete Book") {
        deleteBook = Flammarion::Engraving.new
        deleteBook.puts "Delete Book"
        title = ""
        deleteBook.input("Title") {|msg| title = msg['text']}

        deleteBook.button("Delete Book") {
            msg = libraryManager.deleteBook(title)
            if msg == "error"
                deleteBook.puts "The Book #{title} doesn't exist"
            else
                deleteBook.puts "The Book #{title} has been deleted"
            end
        }

    }
    deleteItem.button("Delete Magazine") {
        deleteMagazine = Flammarion::Engraving.new
        deleteMagazine.puts "Delete Magazine"
        title = ""

        deleteMagazine.input("Title") {|msg| title = msg['text']}

        deleteMagazine.button("Delete Magazine") {
            msg = libraryManager.deleteMagazine(title)
            if msg == "error"
                deleteMagazine.puts "The Magazine #{title} doesn't exist"
            else
                deleteMagazine.puts "The Magazine #{title} has been deleted"
            end        }

    }

}

f.wait_until_closed
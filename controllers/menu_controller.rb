# use require_relative to include the address book
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    # display the main menu options to the command line
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    # retrieve user input from the command line with gets
    # gets reads the next line from standard input
    selection = gets.to_i

# use case to determine response to input
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      puts "Good-bye!"
    # terminate program using exit(0)
      exit(0)
    # use else to catch invalid input
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end

  # stub for each methods called in menu
  def view_all_entries
  end

  def create_entry
  # clear the screen for display entry prompts
  system "clear"
  puts "New AddressBloc Entry"
  # use print to prompt user for each Entry attribute
  print "Name: "
  name = gets.chomp
  print "Phone number: "
  phone = gets.chomp
  print "Email: "
  email = gets.chomp

  # add new etnry to the address book using add entry
  address_book.add_entry(name, phone, email)

  system "clear"
  puts "New entry created"
  end

  def search_entries
  # iterate thru all entries using each
  address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s
  # call entry_submenu to display a submenu for each entry
  # add this method at bottom of MenuController
    entry_submenu(entry)
  end

    system "clear"
    puts "End of entries"
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection

      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
     end
  end
end


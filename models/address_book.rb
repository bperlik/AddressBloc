#  load the library using the relative address
 require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end
  end

   def add_entry(name, phone_number, email)
     # create a var to store the insertion index
     index = 0
     entries.each do |entry|
     # compare name with the current entry, if name is earlier, insert index
     # if not increment index and continue comparing 
       if name < entry.name
         break
       end
       index+= 1
     end
     # insert new entry at index 
     entries.insert(index, Entry.new(name, phone_number, email))
   end
 end

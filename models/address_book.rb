#  load the library using the relative address
 require_relative 'entry'
 require "csv"

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
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

   def import_from_csv(file_name)
   # method to read file, using File.read, use csv class to parse the file
   # result is an object of type CSV::Table
     csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
     # iterate over the CSV::Table rows, create hash for each row
     # convert each row_hash to an Entry by using add_entry method
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
   end

   def remove_entry(name, phone_number, email)
     #create a var to store the index that matches the desired delete
     delete_index = 0
     entries.each do |remove_entry|
     # compare name with the remove_entry, if match, remove by indec
     # if not, increment index and continue comparing
       if name == remove_entry.name
         break
       end
       delete_index+= 1
     end
     # remove matching entry at index
     entries.delete_at(delete_index)
   end
end

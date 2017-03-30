require_relative '../models/address_book'

 RSpec.describe AddressBook do
    # create instance of Addressbook and assign to variable book
    # using let syntax, use the varible instead of repeating AddressBook.new code
   let(:book) { AddressBook.new }

   # create a helper method, check_entry, to consolidate repeating expect code
   def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
   end

   describe "attributes" do
     it "responds to entries" do
       expect(book).to respond_to(:entries)
     end

     it "initializes entries as an array" do
       expect(book.entries).to be_an(Array)
     end

     it "initializes entries as empty" do
       expect(book.entries.size).to eq(0)
      end
    end

   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   # Test that AddrssBook's .import_from_csv() method is working as expected
   # describe statement to RSpec what we are testing, it = human language
   describe "#import_from_csv" do
     it "imports the correct number of entries" do
       # call the method on the book object, pass the string entries.csv
       book.import_from_csv("entries.csv")
       book_size = book.entries.size

       # Check the size of the entries in AddressBook
       expect(book_size).to eq 5
     end

     #access the first entry in the array of entries, ruby arrays start with zero
     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # check first entry
       entry_one = book.entries[0]
       # add check_entry to check parts of an entry
       check_entry(entry_one, "Bill","555-555-4854", "bill@blocmail.com")
     end

     it "imports the 2nd entry" do
        book.import_from_csv("entries.csv")
        # check second entry
        entry_one = book.entries[1]
         # add check_entry to check parts of an entry
        check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
      end

     it "imports the 3rd entry" do
        book.import_from_csv("entries.csv")
        # check third  entry
        entry_one = book.entries[2]
         # add check_entry to check parts of an entry
        check_entry(entry_three, "Joe","555-555-3660", "joe@blocmail.com")
      end

     it "imports the 4th entry" do
        book.import_from_csv("entries.csv")
        # check fourth  entry
        entry_one = book.entries[3]
        # add check_entry to check parts of an entry
        check_entry(entry_four, "Sally","555-555-4646", "sally@blocmail.com")
      end

     it "imports the 5th entry" do
         book.import_from_csv("entries.csv")
         # check fifth entry
         entry_one = book.entries[4]
         # add check_entry to check parts of an entry
         check_entry(entry_five,"Sussie","555-555-2036", "sussie@blocmail.com")
      end
   end

   describe "#remove_entry" do
      it "removes only one entry from the address book" do
        book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

        expect(book.entries.size).to eq(0)
      end
    end

 end


class Entry
  # These must be accessors because we mutate them
  attr_accessor :name, :phone_number, :email

  def initialize(name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  # creating the string to use to print to console later
  def to_s
     "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

end

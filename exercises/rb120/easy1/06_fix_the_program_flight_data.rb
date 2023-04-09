class Flight
  # attr_accessor :database_handle
  # It seems like a bad idea to create client-side interface to manipulate a 
  # instantiated database.  Perhaps a getter method would be more reasonable.

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

require 'csv'

class Load
  attr_reader :guests

  def initialize(file = "./event_attendees.csv")
    @guests = CSV.open (file), headers: true, header_converters: :symbol
  end
end

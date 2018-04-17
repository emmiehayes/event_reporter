require 'csv'
require 'pry'
require './lib/clean'
require './lib/load'

class Guest
  include Clean

  attr_reader   :regdate,
                :first_name,
                :last_name,
                :email_address,
                :homephone,
                :street,
                :city,
                :state,
                :zipcode

  def initialize(guest)
    @regdate       = Clean.clean_regdate(row[:regdate])
    @first_name    = Clean.clean_first_name(row[:first_name])
    @last_name     = Clean.clean_last_name(row[:last_name])
    @email_address = Clean.clean_email(row[:email_address])
    @homephone     = Clean.clean_home_phone(row[:homephone])
    @street        = Clean.clean_street(row[:street])
    @city          = Clean.clean_city(row[:city])
    @state         = Clean.clean_state(row[:state])
    @zipcode       = Clean.clean_zipcode(row[:zipcode])
  end
end

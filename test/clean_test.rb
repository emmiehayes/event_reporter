require 'minitest/autorun'
require 'minitest/pride'
require './lib/clean'
require 'pry'

class CleanTest < Minitest::Test

  def test_it_can_remove_time_stamp
    assert_equal "11/12/08", Clean.clean_regdate("11/12/08 13:23")
  end

  def test_it_can_clean_first_name
    assert_equal "Taylor", Clean.clean_first_name("taylor")
    assert_equal "Taylor", Clean.clean_first_name("TAYLOR")
    assert_equal "Taylor", Clean.clean_first_name("      taylor")
    assert_equal "Taylor", Clean.clean_first_name("taylor   ")
  end

  def test_it_can_clean_last_name
    assert_equal "Swift", Clean.clean_last_name("swift")
    assert_equal "Swift", Clean.clean_last_name("SWIFT")
    assert_equal "Swift", Clean.clean_last_name("      swift")
    assert_equal "Swift", Clean.clean_last_name("swift   ")
  end

  def test_it_can_clean_email_address
    assert_equal "Tay13@gmail.com", Clean.clean_email("Tay13@gmail.com    ")
  end

  def test_it_can_clean_street
    assert_equal "55 reputation street", Clean.clean_email("55 reputation street" )
  end

  def test_it_can_clean_city
    assert_equal "New York", Clean.clean_city("NEW YORK")
    assert_equal "New York", Clean.clean_city("new york")
    assert_equal "New York", Clean.clean_city("      new york")
    assert_equal "New York", Clean.clean_city("new york   ")
  end

  def test_it_can_clean_state
    assert_equal "NY", Clean.clean_state("ny")
    assert_equal "NY", Clean.clean_state("nY")
    assert_equal "NY", Clean.clean_state("      Ny")
    assert_equal "NY", Clean.clean_state("ny   ")
  end

  def test_it_can_clean_zipcode
    assert_equal "00000", Clean.clean_zipcode(nil)
    assert_equal "12345", Clean.clean_zipcode("12345678")
    assert_equal "55602", Clean.clean_zipcode("55602")
    assert_equal "00000", Clean.clean_zipcode("")
  end

  def test_it_can_clean_phone_number
    assert_equal "0000000000", Clean.clean_home_phone(nil)
    assert_equal "0000000000", Clean.clean_home_phone(" ")
    assert_equal "2023332222", Clean.clean_home_phone("202-333-2222")
  end
end

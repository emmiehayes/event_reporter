module Clean

  def Clean.clean_regdate(regdate)
    regdate.split[0]
  end

  def Clean.clean_first_name(first_name)
    first_name.strip.capitalize
  end

  def Clean.clean_last_name(last_name)
    last_name.strip.capitalize
  end

  def Clean.clean_email(email_address)
    email_address.strip
  end

  def Clean.clean_home_phone(homephone)
    if homephone.nil? || homephone.start_with?(" ")
      homephone = "0000000000"
    else
      homephone.delete("(" ")" "-" "." " ")
    end
  end

  def Clean.clean_street(street)
    street.strip
  end

  def Clean.clean_city(city)
    clean = city.split.map(&:capitalize).join(' ')
    city = clean.strip
  end

  def Clean.clean_state(state)
    state.to_s.strip.upcase
  end

  def Clean.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end
end

# frozen_string_literal: true

require_relative '../helpers/covid_helper.rb'

class CovidService
  include CovidHelper

  def get_all
    request_data(API_URL)
  end

  def state_data(state)
    if state_is_valid?(state)
      request_data("#{API_URL}&place_type=state&state=#{state}")
    end
  end

  def all_cities(state)
    cities = state_data(state)
    cities unless cities.nil?
  end

  def get_cases_by_city(city, _state)
    cities = get_all
    cities&.find { |ct| ct['city'] == city }
  end
end

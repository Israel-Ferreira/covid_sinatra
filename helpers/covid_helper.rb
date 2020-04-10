# frozen_string_literal: true

require 'json'
require 'rest-client'

module CovidHelper
  API_URL = 'https://brasil.io/api/dataset/covid19/caso/data?format=json&page_size=10000&is_last=True'
  BR_STATES = %i[SP RJ GO DF ES MG SE SC PE BA AC AL MA MS MT AM PA RS RN PB PI TO RR RO AP PR CE].freeze

  def parse_json(data)
    json_data = JSON.parse(data)
    json_data['results']
  end

  def request_data(url)
    data = RestClient.get(url)
    parse_json(data.body)
  end

  def state_is_valid?(state)
    BR_STATES.include?(state.to_sym)
  end
end

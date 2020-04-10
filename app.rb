# frozen_string_literal: true

require 'sinatra'

require './services/covid_service.rb'

covid_service = CovidService.new

get '/country_situation' do
  covid_service.get_all.to_json
end

get '/state_situation' do
  puts params
  state = params['state']
  data = covid_service.state_data(state)

  if data.nil?
    content = { message: 'Estado não encontrado' }
    content.to_json
  else
    data.to_json
  end
end

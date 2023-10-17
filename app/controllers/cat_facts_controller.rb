class CatFactsController < ApplicationController
  def index
    url = 'https://catfact.ninja/fact'

    begin
      response = ::RestClient.get(url)
      data = JSON.parse(response.body)

      @cat_fact = data['fact']
    rescue RestClient::ExceptionWithResponse => e
      @cat_fact = "Error fetching cat fact: #{e.message}"
    end
  end

  def create

  end
end

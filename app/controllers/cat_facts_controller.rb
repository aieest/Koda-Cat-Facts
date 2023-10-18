class CatFactsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @cat_facts = CatFact.order(created_at: :desc)
  end

  def create
    url = 'https://catfact.ninja/fact'

    begin
      response = ::RestClient.get(url)
      data = JSON.parse(response.body)

      # Create a new cat fact associated with the current user
      @cat_fact = current_user.cat_facts.create(fact: data['fact'])
      flash[:notice] = "New cat fact generated!"
    rescue RestClient::ExceptionWithResponse => e
      flash[:alert] = "Error fetching cat fact: #{e.message}"
    end

    redirect_to cat_facts_path
  end

  def destroy
    @cat_fact = CatFact.find(params[:id])
    @cat_fact.destroy
    redirect_to cat_facts_path
  end
end

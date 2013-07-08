require 'spec_helper'

describe SessionsController do

  describe "GET /" do
    it 'routes to sessions#index' do
      get('/').should route_to(controller: 'sessions', action: 'index')
    end
  end

  describe "GET /signin" do
    it 'routes to sessions#new' do
      get('/signin').should route_to(controller: 'sessions', action: 'new')
    end
  end

  describe "POST /signin" do
    it 'routes to sessions#create' do
      post('/signin').should route_to(controller: 'sessions', action: 'create')
    end
  end

  describe "DELETE /signout" do
    it 'routes to sessions#destroy' do
      delete('/signout').should route_to(controller: 'sessions', action: 'destroy')
    end
  end

end
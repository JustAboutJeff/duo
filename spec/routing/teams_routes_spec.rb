require 'spec_helper'

describe TeamsController do

  describe "GET /teams" do
    it 'routes to teams#index' do
      get('/teams').should route_to(controller: 'teams', action: 'index')
    end
  end

  describe "POST /teams" do
    it 'routes to teams#create' do
      post('/teams').should route_to(controller: 'teams', action: 'create')
    end
  end

  describe "POST /teams/:id/repopulate" do
    it 'routes to teams#repopulate' do
      post('/teams/1/repopulate').should route_to(controller: 'teams', action: 'repopulate', id: '1')
    end
  end

  describe "DELETE /teams/:id" do
    it 'routes to teams#destroy' do
      delete('/teams/1').should route_to(controller: 'teams', action: 'destroy', id: '1')
    end
  end
end

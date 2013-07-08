require 'spec_helper'

describe UsersController do

  describe "GET /users" do
    it 'routes to users#index' do
      get('/users').should route_to(controller: 'users', action: 'index')
    end
  end

  describe "GET /users/:id" do
    it 'routes to users#show' do
      get('/users/1').should route_to(controller: 'users', action: 'show', id: '1')
    end
  end

  describe "GET /users/new" do
    it 'routes to users#new' do
      get('/users/new').should route_to(controller: 'users', action: 'new')
    end
  end

  describe "POST /users/build" do
    it 'routes to users#build' do
      post('/users/build').should route_to(controller: 'users', action: 'build')
    end
  end

  describe "POST /users" do
    it 'routes to users#create' do
      post('/users').should route_to(controller: 'users', action: 'create')
    end
  end

  describe "DELETE /users/:id" do
    it 'routes to users#destroy' do
      delete('/users/1').should route_to(controller: 'users', action: 'destroy', id: '1')
    end
  end
end

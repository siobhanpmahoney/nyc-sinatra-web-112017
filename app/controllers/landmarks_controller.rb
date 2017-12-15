class LandmarksController < ApplicationController

  #all instances
    get '/landmarks' do
      @landmarks = Landmark.all
      erb :'landmarks/index'
    end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end


  #new instance form data
    post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      redirect to "landmarks/#{@landmark.id}"
    end

  #one instance
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  #edit instance view
  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end

#checkbox
   # post /figure/new
   #  Landmark.all
   #  erb :figure/

end

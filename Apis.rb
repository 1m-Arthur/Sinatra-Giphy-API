require 'sinatra'
require "net/http"
require "json"
require './models'

get '/' do
    erb :index
end

post '/results' do
    search_img = params[:search_image]
    api_keys = 'dc6zaTOxFJmzC' #this is public beta key. i got this from https://giphy.api-docs.io/

    urls = api_url(search_img, api_keys)
    resJson = call_api_gif(urls)
    
    @gif_urls = []
    resJson["data"].each do |item|
        @gif_urls.concat([item["images"]["fixed_height"]["url"]])
    end
    
    erb :result
end

def call_api_gif(url)
    uri = URI(url)
    data = Net::HTTP.get_response(uri)
    buff = data.body
    return JSON.parse(buff)
end

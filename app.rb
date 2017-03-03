require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'date'
require './models/birth.rb'
require 'open-uri'
require 'net/http'
require 'json'
require 'sinatra/json'

post '/signup' do
    params = JSON.parse request.body.read
        @user = User.create(
            fb_user_id: params["fb_user_id"], 
            birthday: params["birthday"], 
            name: params["name"]
        )
end

get '/login/:fb_user_id' do
   redirect "/users/#{params[:fb_user_id]}" 
end

get '/users/:fb_user_id' do
    @user = User.find(params[:fb_user_id]).to_json
end

get '/users/:fb_user_id/friends' do
    @friends = Friend.where(fb_user_id: params[:fb_user_id]).to_json
end

post '/messages' do
    params = JSON.parse request.body.read
    @message = Message.create(
        content: params["content"],
        receiver_id: params["receiver_id"],
        sender_id: params["sender_id"]
    )
end

get '/messages/receive/:fb_user_id' do
    @receive_messages = Message.where(receiver_id: params[:fb_user_id]).to_json
end

get '/messages/:send/:fb_user_id' do
    @send_messages = Message.where(sender_id: params[:fb_user_id]).to_json
end

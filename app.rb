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
        # redirect "/friend/#{params["fb_user_id"]}"
end

get '/login/:fb_user_id' do
   redirect "/users/#{params[:fb_user_id]}" 
end

post '/friends/:fb_user_id' do
    user_id = params[:fb_user_id] #自分のfb_user_idを友達にマーキング
    params = JSON.parse request.body.read
    @friend = Friend.create(
        user_id: user_id, #自分のfb_user_idを友達にマーキング
        fb_user_id: params["fb_user_id"], #友達のfb_user_idのこと
        birthday: params["birthday"],
        name: params["name"]
    )
end

get '/users/:fb_user_id' do
    @user = User.find(params[:fb_user_id]).to_json
end

get '/users/:fb_user_id/friends' do
    @friends = Friend.where(user_id: params[:fb_user_id]).to_json
end

post '/messages' do
    params = JSON.parse request.body.read
    receiver_name = Friend.where(fb_user_id: params["receiver_id"]).pluck(:name).first
    sender_name = User.where(fb_user_id: params["sender_id"]).pluck(:name).first
    @message = Message.create(
        content: params["content"],
        receiver_id: params["receiver_id"],
        sender_id: params["sender_id"],
        sender_name: sender_name, #sender_nameには自分の名前を
        receiver_name: receiver_name #receiver_nameには送信先の友達の名前を
    )
end

get '/messages/receive/:fb_user_id' do
    @receive_messages = Message.where(receiver_id: params[:fb_user_id]).to_json
    
end

get '/messages/send/:fb_user_id' do
    @send_messages = Message.where(sender_id: params[:fb_user_id]).to_json
end
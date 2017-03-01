require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'date'
require './models/birth.rb'
require 'open-uri'
require 'net/http'
require 'json'
require 'sinatra/json'
enable :sessions

post '/signup' do
    @user = User.create(
        user_id: params[:user_id], 
        fb_user_id: params[:fb_user_id], 
        birthday: params[:birthday], 
        name: params[:name],
        icon: params[:icon], 
        friends: params[:friends]
    )
end

get '/users/:fb_user_id' do
    @friends = Friend.all
    @birthday = @friends.birthday.find(params[:fb_user_id]).order('date')
    @name =  @friends.name.find(params[:fb_user_id])
    data = {
        responseData: {
            results: [
                "title": "Hello Swift:)",
                "message": "入力して送信してね！"
            ]
        }
    }
    json data
end

get '/message' do
    
end

post '/messages' do
    @message = Message.create(
        content: params[:content],
        receiver_id: params[:receiver_id],
        sender_id: params[:sender_id],
        message_id: params[:message_id]
    )
end

get '/messages?receiver_id' do
    @receive_messages = Message.find(params[:receiver_id])
    data = {
        responseData: {
            results: [
                "title": "Hello Swift:)",
                "message": "入力して送信してね！"
            ]
        }
    }
    json data
end

get '/messages?sender_id' do
    @send_messages = Message.find(params[:sender_id])
    data = {
        responseData: {
            results: [
                "title": "Hello Swift:)",
                "message": "入力して送信してね！"
            ]
        }
    }
    json data
end

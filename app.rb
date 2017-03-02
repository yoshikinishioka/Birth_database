require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'date'
require './models/birth.rb'
require 'open-uri'
require 'net/http'
require 'json'
require 'sinatra/json'

post '/login', provide: :json do
    params = JSON.parse request.body.read
    
    @user = User.create(
        fb_user_id: params[:fb_user_id], 
        birthday: params[:birthday], 
        name: params[:name]
    )
end

# post '/user/:user_id/register_friends' do
#     @friends = Friend.create(
#         fb_user_id: params[:fb_user_id],
#         birthday: params[:birthday],
#         name: params[:name]
#     )
# end

get '/users/:user_id/friends' do
    @friends = Friend.where(user_id: params[:user_id]).to_json
end

post '/messages' do
    @message = Message.create(
        content: params[:content],
        receiver_id: params[:receiver_id],
        sender_id: params[:sender_id],
        message_id: params[:message_id]
    )
end

get '/messages/:receiver_id' do
    @receive_messages = Message.where(receiver_id: params[:receiver_id]).to_json
end

get '/messages/:sender_id' do
    @send_messages = Message.where(sender_id: params[:sender_id]).to_json
end

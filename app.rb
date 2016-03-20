require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'

class Post < ActiveRecord::Base
end

get "/posts" do
  content_type :json
  @posts = Post.order("created_at DESC")
  @posts.to_json
end

post "/posts" do
  content_type :json
  @post = Post.new(params[:post])
  if @post.save
    @post.to_json
  end
end

get "/posts/:id" do
  content_type :json
  @post = Post.find(params[:id])
  @post.to_json
end
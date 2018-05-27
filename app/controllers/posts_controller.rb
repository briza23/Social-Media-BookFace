class PostsController < ApplicationController
  def index
    load_all_data
  end

  def create
    puts "TESTTTT 1 #{params.to_json}"
    puts "Testtttt #{current_user[:name]}"
    post = Post.new
    post.contents = params[:contents]
    post.user_id  = current_user[:id]
    post.name     = "GG"
    post.save
    load_all_data
    render :index
  end

  def delete
    Post.find_by(id: params[:id]).destroy
    load_all_data
    render :index
  end

  def update
    post = Post.find_by(id: params[:id])
    post.contents = params[:contents]
    post.save
    load_all_data
    render :index
  end

  def add_friend
    friend = Friendship.new
    friend.friend_a = params[:friend_a]
    friend.friend_b = params[:friend_b]
    friend.save
    load_all_data
    redirect_to('/')
  end

  def unfriend
    id = params[:id]
    current_user_id = current_user[:id] 
    find_id = Friendship.where(friend_a: id, friend_b: current_user_id).or(Friendship.where(friend_a: current_user_id, friend_b: id))
    Friendship.find_by(id: find_id).destroy
    load_all_data
    redirect_to('/')
  end

  def load_all_data
    current_user_id = current_user[:id]
    friend_query = Friendship.where("friendships.friend_a = #{current_user_id} OR friendships.friend_b = #{current_user_id}")
    friend_id = friend_query.map do |value|
      value[:friend_a].to_s == current_user_id.to_s ? value[:friend_b] : value[:friend_a]
    end
    @users = User.where.not(id: [friend_id])
    @friends = User.where(id: friend_id)
    friend_id << current_user_id
    @posts = Post.where(user_id: friend_id)
  end
end

# export GEM_HOME=~/.gem
# export GEM_PATH=~/.gem
# https://tandahq.github.io/manila-rails-bootcamp-2018/
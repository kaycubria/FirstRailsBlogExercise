class PostsController < ApplicationController

  def home
    @posts = Post.all.order("id ASC")
## should show all blog posts and have a button to sign in
  end

  def index
    @posts = User.find_by_id(session[:user_id]).posts
  end

  def new
  end

  def create
  	@user = User.find_by_id(session[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @user
    else
      redirect_to "users/#{user.find_by_id(session[:user_id]).id}/posts/new"
    end
  end

  def destroy
  	Post.find_by_id(params[:id]).destroy
  	redirect_to @user
  end

  private

  def post_params
    params.require(:post).permit(:title, :subhead, :content)
  end

end

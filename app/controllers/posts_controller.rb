class PostsController < ApplicationController

  def index
     @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize! :create, Post, message: "You need to be a memeber to create a new post."
  end

  def create
    @post = current_user.posts.build(params[:post])
    authorize! :create, @post, message: "You need to be signed up to do that."
    if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
    else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end
  
  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to own the post to do that."
    end

   def update
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to own the post to edit it."
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end

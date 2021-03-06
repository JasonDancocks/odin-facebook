class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = []
    friend_posts = Post.where("user_id IN (?)", current_user.friends)
    friend_posts.each do |p|
      @posts << p
    end
    current_user.posts.each do |p|
      @posts << p
    end
    @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post created."
      redirect_to root_url
    else
      flash[:error] = "Unable to create post"
      redirect_back fallback_location: root_url
    end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    if @post.update(post_params)
      flash[:notice] = "Post updated."
      redirect_to root_url
    else
      flash[:error] = "Unable to update post"
      redirect_back fallback_location: root_url
    end
    
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_back fallback_location: root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end

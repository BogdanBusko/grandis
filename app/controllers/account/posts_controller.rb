class Account::PostsController < Account::AccountController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @posts = pagy(posts.ordered)
  end

  def show; end

  def new
    @post = posts.build
  end

  def create
    @post = posts.build(post_params)

    if @post.save
      redirect_to account_post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to account_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @pagy, @posts = pagy(posts.ordered, page: params[:page] || 1)

    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def posts
    current_user.posts
  end

  def set_post
    @post = posts.find(params[:id])
  end
end

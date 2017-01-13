class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
      @posts = Post.all.order('created_at DESC')
    end

    def new
      @post = Post.new
      # @post.user = current_user #Added
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = current_user.posts.where(id: params[:id]).first
      unless @post
        flash[:error] = "Not authorized to edit post"
        redirect_to action: :show, id: params[:id]
      end
    end

    def update
      @post = current_user.posts.where(id: params[:id]).first
      if @post
        if @post.update(params[:post].permit(:title, :body))
          flash[:notice] = "Success post updated"
          redirect_to @post
        else
          render 'edit'
        end
      else
        flash[:error] = "Not authorized to edit post"
        redirect_to action: :show, id: params[:id]
      end
    end
    def destroy
      @post = current_user.posts.where(params[:id]).first
      if @post
        @post.destroy
        flash[:notice] = "Post deleted"
        redirect_to action: :index
      else
        flash[:error] = "Not authorized to edit post"
        redirect_to action: :show, id: params[:id]
      end
    end

    private
      def post_params
        params.require(:post).permit(:title, :body)
      end
end

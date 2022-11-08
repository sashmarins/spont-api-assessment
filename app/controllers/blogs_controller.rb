class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end
  # get endpoints also needs to show categories

  # GET /blogs/1 or /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
  end

  # GET by category

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.save!
    if @blog.save!
      render json: @blog
    end
  end
  # needs to have category availability s

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    @blog.save!
  end
  # categories again

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :user_id)
    end
end

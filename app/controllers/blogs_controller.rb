class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @blog = Blog.new
  end

  def edit

  end

  def show
  end

  def update

  end

end
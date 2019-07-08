# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
     @posts = Post.all

     if (params[:category])
        category = Category.where(name: params[:category]).first
        if(category.present?)
          @posts = category.posts.page(params[:page]).per(7)
        else
          @posts = Post.where(nil).page(params[:page]).per(7)
        end
     else
       @posts = Post.all.page(params[:page]).per(7)
     end

    @tags = Post.mount_tags_collection
    @posts.page(params[:page]).per(7)
    respond_with(@posts)
  end

  def show
    @tags = Post.mount_tags_collection
    respond_with(@post)
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end

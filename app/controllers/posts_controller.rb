# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @tags = Post.mount_tags_collection
    @posts = Post.all.page(params[:page]).per(2)
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

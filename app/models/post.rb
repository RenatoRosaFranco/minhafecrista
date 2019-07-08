# frozen_string_literal: true

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => :slugged

  self.table_name  = 'posts'
  self.primary_key = 'id'

  belongs_to :category
  belongs_to :user

  def self.mount_tags_collection
    @collection_tags ||= []
    self.all.each do |post|
      tags = post.tags.split(/\s/)
      tags.each do |tag|
        @collection_tags << tag if !@collection_tags.include?(tag)
      end
    end

    puts @collection_tags
    @collection_tags
  end

  validates :title,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 50 }

  validates :description,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 245 }

  validates :content,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 25_000 }

  validates :tags,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 145 }
end

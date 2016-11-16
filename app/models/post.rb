class Post < ApplicationRecord
  belongs_to :cate
  belongs_to :user

  #關鍵字
  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  enum status: %i(draft published)
  self.per_page = 10
  # 原本是input.to_s.parameterize，但是parameterize只支援英文跟數字，所以改用babosa的to_slug
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  # 定義slug_candidates，預設會找第一個，如果有重複的name就會找第二個（name-price），最後才會生成亂序
  def slug_candidates
    [
        :title,
        [:title, :id]
    ]
  end
  #編輯送出後，更新slug
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  #關鍵字
  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
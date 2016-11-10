class Post < ApplicationRecord
  belongs_to :cate
  belongs_to :user
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
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
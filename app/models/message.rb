class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  #もし画像が存在しないなら、コンテントカラム（テキスト）は存在しなくてはならない
  #画像もしくはテキストは存在しなくてはならない
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

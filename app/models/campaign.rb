class Campaign < ActiveRecord::Base
  monetize :amount_to_raise_cents
  mount_uploader :picture, PictureUploader
  
  belongs_to :category
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

  validates :title, presence: true, length: { maximum: 100 }
  validates :amount_to_raise, presence: true, numericality: { greater_than_or_equal_to: 500 }
  validates :picture, presence: true
  validates :category, presence: true
  validates :story, presence: true
end

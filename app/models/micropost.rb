class Micropost < ActiveRecord::Base
  has_attached_file :microphoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :microphoto, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end

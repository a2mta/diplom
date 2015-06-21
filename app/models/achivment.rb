class Achivment < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :achive_content, presence: true, length: { maximum: 140 }
  has_attached_file :achive_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :achive_photo, :content_type => /\Aimage\/.*\Z/

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids})",
          user_id: user.id)
  end
end

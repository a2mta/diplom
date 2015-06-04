class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :achivments, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  attr_accessor :password
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: {message: "Email не может быть пустым"},

            :format => {:with => email_regex, message: "Email не соответствует формату"},

            :uniqueness => {:case_sensitive => false}

  validates :name, presence: {message: "Имя не может быть пустым"},

            :length => {:maximum => 50}

  validates :password, presence: {message: "Пароль не может быть пустым"},

            confirmation: {message: "Пароль не совпадают"},

            :length => {:within => 6..40, message: "Пароль cлишком короткий (минимум 6 символов)"}


  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private

  def encrypt_password
    self.salt = make_salt unless has_password?(password)
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string
#  email              :string
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string
#  salt               :string
#  info               :text
#


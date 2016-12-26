class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  
  before_save {self.email = email.downcase}
  validates :name, 
            presence: true, 
            length:{minimum: 3, maximum: 25},
            uniqueness:{ case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
            presence:true, 
            uniqueness:{ case_sensitive: false},
            length:{minimum: 3, maximum: 25},
            format:{ with: VALID_EMAIL_REGEX}
  validates :password_digest,
            presence: true
  

  has_secure_password
end
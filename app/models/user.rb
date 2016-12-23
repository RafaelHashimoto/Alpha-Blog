class User < ActiveRecord::Base
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
          
end
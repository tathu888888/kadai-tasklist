class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
<<<<<<< HEAD
  has_many :tasks
=======
  has_many :task_posts
>>>>>>> abb0becc9320e6fc48d3f2ea359f022dbdbc7ff4
end

class User < ActiveRecord::Base
    has_many :snippets
    has_secure_password

    validates :username, :email, :password, presence: true

    validates_uniqueness_of :username, :email, case_sensitive: false

    has_and_belongs_to_many :followed_users,
      class_name: "User", 
      join_table:  :followed_users, 
      foreign_key: :user_id, 
      association_foreign_key: :friend_user_id

    

    def slug 
        sloog = self.username.gsub(" ", "-").downcase
    end

    def self.find_by_slug(sloog)
        unsloog = sloog.gsub("-", " ")
        self.find_by(username: unsloog)
    end
end
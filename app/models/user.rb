class User < ActiveRecord::Base
    has_many :snippets
    has_secure_password

    validates :username, :email, :password, presence: true
end
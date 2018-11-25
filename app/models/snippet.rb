class Snippet < ActiveRecord::Base
    belongs_to :user
    validates :title, :brief, presence: true
end
class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :imageable, polymorphic: true
    validates_presence_of :content
    validates_length_of :content, :within => 1..100
end

class Post < ApplicationRecord
    validates :contents, presence: true
    belongs_to :user
end

class Blog < ApplicationRecord
    belongs_to :user
    has_many :favarites, dependent: :destroy
    has_many :favarite_users,  through: :favarites, source: :user
end

class UserCharacter < ActiveRecord::Base
    has_many :users
    has_many :characters
end
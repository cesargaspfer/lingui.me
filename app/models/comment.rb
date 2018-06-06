class Comment < ApplicationRecord
    validates_presence_of :text
end

class Question < ActiveRecord::Base
  belongs_to :anonymous_user
  has_many :votes, dependent: :destroy
end

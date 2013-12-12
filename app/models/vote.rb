class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :anonymous_user
end

class AnonymousUser < ActiveRecord::Base
  def set_username
    Anonymizer.new.generate_alias
  end
end

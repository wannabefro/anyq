class AnonymousUser < ActiveRecord::Base
  has_many :questions, dependent: :nullify

  def set_username
    Anonymizer.new.generate_alias
  end
end

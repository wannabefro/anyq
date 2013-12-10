class AnonymousUserSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :username, :current_user

  def current_user
    self.options[:current_user] || false
  end
end

class AnonymousUserSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :username
end

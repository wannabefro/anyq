class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :ip

  def ip
    '12345'
  end

  def name
    'hello'
  end

end

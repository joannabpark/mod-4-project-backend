class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :password, :first_name, :last_name
    has_many :notes
  end
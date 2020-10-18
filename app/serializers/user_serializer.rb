class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :first_name, :last_name
  has_many :notes
end

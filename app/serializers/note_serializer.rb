class NoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :user_id
  belongs_to :user
end

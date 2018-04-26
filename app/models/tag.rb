class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  embedded_in :note, :inverse_of => :tags
end

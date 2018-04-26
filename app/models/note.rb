class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  embeds_many :tags, :inverse_of => :note

  # Model Validations
  validates_presence_of :title, :body

  # This will help to white list tag's attributes while creating note
  accepts_nested_attributes_for :tags,
                                :allow_destroy => true,
                                :reject_if => :all_blank

end

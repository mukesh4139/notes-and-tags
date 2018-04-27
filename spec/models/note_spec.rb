require 'rails_helper'

RSpec.describe Note, type: :model do

  describe "creation" do
    it "should have one item created after being created" do
      Note.create(title: 'title', body: 'this is long body')
      expect(Note.count).to eq(1)
    end

    it "should save all the tags along with note" do
      note = Note.create(title: 'title', body: 'this is long body', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}])
      expect(note.tags.count).to eq(2)
    end
  end

  describe "creation without mandatory parameters" do
    it "should invalidate creation of note without title" do
      note = Note.create(body: 'this is long body', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}])
      expect(note.valid?).to eq(false)
    end

    it "should invalidate creation of note without body" do
      note = Note.create(title: 'title', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}])
      expect(note.valid?).to eq(false)
    end
  end
end

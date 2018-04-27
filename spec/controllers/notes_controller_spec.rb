require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  before(:each) do
    10.times do
      title = Faker::Lorem.sentence
      body = Faker::Lorem.paragraph
      tags_attributes = []

      for i in 0..rand(1..4)
        tags_attributes << { title: Faker::Lorem.word }
      end

      Note.create(title: title,
                  body: body,
                  tags_attributes: tags_attributes
      )
    end
  end

  describe "GET #index" do
    it "populates an array of notes" do
      notes = Note.all
      get :index
      expect(assigns(:notes).length).to eq(notes.length)
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "should return the requested note" do
      note = Note.first
      get :show, id: note.id
      expect(assigns(:note)).to eq(note)
    end
  end

  describe "GET #new" do
    it "assigns 10 tags to new note" do
      get :new
      expect(assigns(:note).tags.length).to eq(10)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new note" do
        expect {
          post :create, note: {title: 'title', body: 'this is long body', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}]}
        }.to change(Note, :count).by(1)
      end

      it "redirects to the new note" do
        post :create, note: {title: 'title', body: 'this is long body', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}]}
        expect(response).to redirect_to(Note.order_by('created_at DESC').first)
      end
    end

    context "with invalid attributes" do
      it "does not save the new note" do
        expect {
          post :create, note: {title: 'title'}
        }.to_not change(Note, :count)
      end

      it "re-renders the new method" do
        post :create, note: {title: 'title'}
        expect(response).to render_template(:new)
      end
    end
  end
end

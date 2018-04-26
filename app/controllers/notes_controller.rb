class NotesController < ApplicationController
  before_action :set_note, only: [:show]

  # GET /notes
  # GET /notes.json
  def index
    @export_notes = Note.all.order('created_at ASC')
    @notes = @export_notes.page(params[:page]).per(20)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    10.times { @note.tags.build } # Maximum number of tags is set to 10
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:title, :body, :tags_attributes => [:title])
  end
end

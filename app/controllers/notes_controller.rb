class NotesController < ApplicationController

    def index
        notes = Note.all 
        render json: NoteSerializer.new(notes)
    end

    def show
        note = Note.find(params[:id])
        render json: NoteSerializer.new(note)
    end

    def new
        note = Note.new
    end

    def create
        note = Note.create(note_params)
        render json: NoteSerializer.new(note)
    end

    def edit
    end

    def update
        note = Note.find(params[:id])
        note.update(note_params)
        render json: NoteSerializer.new(note)
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        render json: { message: 'success'}
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :user_id)
    end

end

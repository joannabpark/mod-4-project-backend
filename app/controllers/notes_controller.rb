class NotesController < ApplicationController

    def index
        @notes = Note.all 
        render json: @notes
    end

    def show
        @note = Note.find(params[:id])
        render json: @note
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            render json: @note
        else
            render json: @note.errors
        end
    end

    def update
        @note = Note.find(params[:id])
        if @note.update
            render json: @note
        else
            render json: @note.errors
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        render json: { message: 'success'}
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :user_id)
    end

end

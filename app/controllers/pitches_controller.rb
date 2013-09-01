class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all.sort { |x, y| x.score <=> y.score }.reverse
  end

  def show
    @pitch = Pitch.find(params[:id])
    @reactions = Reaction.where(pitch_id: params[:id])
    @reaction = @pitch.reactions.build
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = current_user.pitches.create(pitch_params)
    redirect_to pitch_path(@pitch)
  end

  def upvote
    puts "is this happening???"
    @pitch = Pitch.find(params[:id])
    current_user.upvote!(@pitch)
    p @pitch.score
    # redirect_to pitch_path(@pitch)
    render partial: 'score', locals: { pitch: @pitch.score }
  end

  def downvote
    @pitch = Pitch.find(params[:id])
    current_user.downvote!(@pitch)
    # redirect_to pitch_path(@pitch)
    render partial: 'score', locals: { pitch: @pitch.score }
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title, :content)
  end
end

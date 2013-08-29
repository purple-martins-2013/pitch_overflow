class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all.sort_by { |p| p.score }.reverse
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
    @pitch = Pitch.create!(pitch_params)
    redirect_to pitch_path(@pitch)
  end

  def upvote
    @pitch = Pitch.find(params[:id])
    @pitch.upvote!
    redirect_to pitch_path(@pitch)
  end

  def downvote
    @pitch = Pitch.find(params[:id])
    @pitch.downvote!
    redirect_to pitch_path(@pitch)
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title, :content)
  end
end

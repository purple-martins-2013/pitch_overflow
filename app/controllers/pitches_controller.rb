class PitchesController < ApplicationController

  before_filter :find_pitch, only: [:upvote, :downvote, :show]
  def index
    @pitches = Pitch.all.sort { |x, y| x.score <=> y.score }.reverse
  end

  def show
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = current_user.pitches.create(pitch_params)
    redirect_to pitch_path(@pitch)
  end

  def upvote
    current_user.upvote!(@pitch)
    render partial: 'score', locals: { score: @pitch.score }
  end

  def downvote
    current_user.downvote!(@pitch)
    render partial: 'score', locals: { score: @pitch.score }
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title, :content)
  end

  def find_pitch
    @pitch = Pitch.find(params[:id])
  end
end

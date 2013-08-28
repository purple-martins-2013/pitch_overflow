class PitchesController < ApplicationController

  def index
    @pitches = Pitch.all
  end
end

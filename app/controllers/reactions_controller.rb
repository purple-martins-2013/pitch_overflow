class ReactionsController < ApplicationController  
  def create
    pitch = Pitch.find(params[:pitch_id])
    redirect_to pitch_path(pitch)
  end

end

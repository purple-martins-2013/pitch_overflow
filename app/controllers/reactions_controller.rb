class ReactionsController < ApplicationController  

  def create
    pitch = Pitch.find(params[:pitch_id])
    pitch.reactions.create(reaction_params)
    redirect_to pitch_path(pitch)
  end
  
  private

  def reaction_params
    params.require(:reaction).permit(:content)
  end
  
end

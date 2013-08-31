class ReactionsController < ApplicationController  

  def create
    pitch = Pitch.find(params[:pitch_id])
    reaction = pitch.reactions.create(reaction_params)
    render partial: "pitches/reaction", locals: { reaction: reaction }
  end
  
  private

  def reaction_params
    params.require(:reaction).permit(:content)
  end
  
end

class ReactionsController < ApplicationController  

  before_action :require_login, only: [:create]

  def create
    pitch = Pitch.find(params[:pitch_id])
    pitch.reactions.create(reaction_params)
    redirect_to pitch_path(pitch)
  end
  
  private

  def require_login
    unless current_user
      redirect_to '/auth/github'
    end
  end

  def reaction_params
    params.require(:reaction).permit(:content)
  end

end

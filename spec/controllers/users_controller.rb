class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      # Traite un succès d'enregistrement.
    else
      @titre = "Inscription"
      render 'new'
    end
  end
end

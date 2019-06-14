class ClubsController < ApplicationController
  before_action :find_club, only: [:show, :edit, :update, :destroy]

  def index
    @clubs = Club.all
  end

  def show
  end

  def new
    @club = current_user.clubs.build
  end

  def create
    @club = current_user.clubs.build(club_params)

    if @club.save
      redirect_to club_path(@club), notice: "Successfully created new club!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @club.update(club_params)
      redirect_to club_path(@club), notice: "Successfully updated club!"
    else
      render 'edit'
    end
  end

  def destroy
    @club.destroy
    redirect_to root_path, notice: "Succesfully deleted club!"
  end

  private

  def find_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :genre, :description)
  end
end

class BoatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boats = Boat.all
  end

  def show
    find_params
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    find_params
  end


  def destroy
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :containers)
  end

  def find_params
    @boat = Boat.find_by(params[:name])
  end

end

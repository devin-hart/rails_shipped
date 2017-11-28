class BoatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find_by(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user_id = current_user.id
    if @boat.save
      redirect_to @boat
    else
      render 'new'
    end
  end

  def update
    @boat = Boat.find_by_id(params[:id])
    if @boat.update(boat_params)
      redirect_to @boat
    else
      render 'edit'
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
    @boat = Boat.find_by(params[:id])
  end

end

class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @experiences = policy_scope(Experience)
  end

  def show
    @experience = Experience.find(params[:id])
    @booking = Booking.new
    authorize @experience
  end

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
    redirect_to experiences_path
    authorize @experience
    else
      render :new
    end

    def edit
      authorize @experience
    end

    def destroy
      authorize @experience
    end

    def update
      authorize @experience
    end
  end


private

def experience_params
  params.require(:experience).permit(:name, :address, :description, :price, :duration, :photo)
end

end

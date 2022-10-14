class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new

    respond_to do |format|
      format.html { render :new, locals: { post: @food } }
    end
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:success] = 'Food successfully created'
      redirect_to foods_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to foods_url
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end

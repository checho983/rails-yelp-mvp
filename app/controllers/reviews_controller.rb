class ReviewsController < ApplicationController


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) #se puede sacar el restaurant_id porque esta nesteado(ver Routes)
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # agregamos el id del restaurant al review(porque sino no se va a guardar)
    if @review.save # es el equivalente a hacer @review = Review.new(restaurant_id:1, content:"yummy", rating: 5)
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

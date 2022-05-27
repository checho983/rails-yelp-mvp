Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # /restaurants/:id/reviews/:id, /restaurants/:id/reviews/new, /restaurants/:id/reviews/index
  resources :restaurants do
    resources :reviews, only: [ :index, :new, :create ] #acciones que incluyen el id de restaurants
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ] #agrega las acciones que no dependen del id de restaurants(porque reviews ya tiene su propio id)
end



#rails c
# bristol = Restaurant.new(name: "Cuakquier", address: "eee", rating: 5)
# bristol.save => id: 1
# review = Review.new(comment: "dfd", restaurant_id: 1)

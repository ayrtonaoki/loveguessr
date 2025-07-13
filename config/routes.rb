Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # If you have other Devise models like admins, include them too
  # devise_for :admins
end

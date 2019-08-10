Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #home_controllerのルーティング
  root 'home#top'

  get '/home/about' => 'home#about', as: 'about'

  get 'admin_top' => 'home#admin_top'

  #users_controllerのルーティング
  resources :users

  resources :admins, only: [:index, :edit, :update]


  #stories_controller,favorites_controller.story_comments_controllerのルーティング
  resources :notices do
  	resource :favorites, only: [:create, :destroy]
  end
end

=begin
Prefix Verb   URI Pattern                                                                              Controller#Action
        new_admin_session GET    /admins/sign_in(.:format)                                                                admins/sessions#new
            admin_session POST   /admins/sign_in(.:format)                                                                admins/sessions#create
    destroy_admin_session DELETE /admins/sign_out(.:format)                                                               admins/sessions#destroy
       new_admin_password GET    /admins/password/new(.:format)                                                           admins/passwords#new
      edit_admin_password GET    /admins/password/edit(.:format)                                                          admins/passwords#edit
           admin_password PATCH  /admins/password(.:format)                                                               admins/passwords#update
                          PUT    /admins/password(.:format)                                                               admins/passwords#update
                          POST   /admins/password(.:format)                                                               admins/passwords#create
cancel_admin_registration GET    /admins/cancel(.:format)                                                                 admins/registrations#cancel
   new_admin_registration GET    /admins/sign_up(.:format)                                                                admins/registrations#new
  edit_admin_registration GET    /admins/edit(.:format)                                                                   admins/registrations#edit
       admin_registration PATCH  /admins(.:format)                                                                        admins/registrations#update
                          PUT    /admins(.:format)                                                                        admins/registrations#update
                          DELETE /admins(.:format)                                                                        admins/registrations#destroy
                          POST   /admins(.:format)                                                                        admins/registrations#create
         new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                users/passwords#update
                          PUT    /users/password(.:format)                                                                users/passwords#update
                          POST   /users/password(.:format)                                                                users/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         users/registrations#update
                          PUT    /users(.:format)                                                                         users/registrations#update
                          DELETE /users(.:format)                                                                         users/registrations#destroy
                          POST   /users(.:format)                                                                         users/registrations#create
                     root GET    /                                                                                        home#top
                    about GET    /home/about(.:format)                                                                    home#about
                admin_top GET    /admin_top(.:format)                                                                     home#admin_top
                    users GET    /users(.:format)                                                                         users#index
                          POST   /users(.:format)                                                                         users#create
                 new_user GET    /users/new(.:format)                                                                     users#new
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
                          DELETE /users/:id(.:format)                                                                     users#destroy
                   admins GET    /admins(.:format)                                                                        admins#index
               edit_admin GET    /admins/:id/edit(.:format)                                                               admins#edit
                    admin PATCH  /admins/:id(.:format)                                                                    admins#update
                          PUT    /admins/:id(.:format)                                                                    admins#update
         notice_favorites DELETE /notices/:notice_id/favorites(.:format)                                                  favorites#destroy
                          POST   /notices/:notice_id/favorites(.:format)                                                  favorites#create
                  notices GET    /notices(.:format)                                                                       notices#index
                          POST   /notices(.:format)                                                                       notices#create
               new_notice GET    /notices/new(.:format)                                                                   notices#new
              edit_notice GET    /notices/:id/edit(.:format)                                                              notices#edit
                   notice GET    /notices/:id(.:format)                                                                   notices#show
                          PATCH  /notices/:id(.:format)                                                                   notices#update
                          PUT    /notices/:id(.:format)                                                                   notices#update
                          DELETE /notices/:id(.:format)                                                                   notices#destroy
               refile_app        /attachments

=end

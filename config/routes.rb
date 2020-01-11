Rails.application.routes.draw do

  # デバイス関連
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'users/search'  => 'users#search'
  get 'job_informations/search'  => 'job_informations#search'

  # ユーザー関連
  resources :users, only: [:show, :edit, :destroy, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get :form, on: :member
    get :favorites, on: :member
  end
  resources :notifications, only: :index

  # メッセージ機能関連
  resources :rooms, only: [:create,:show]
  # resources :messages, only: [:create]


  root 'tops#top'
  get 'about' => 'tops#about'

  # 求人票関連
  resources :job_informations, only: [:new, :create, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  # 職種診断用のページ
  get 'accounting' => 'jobchecks#accounting'
  get 'general_affairs' => 'jobchecks#general_affairs'
  get 'human_resources' => 'jobchecks#human_resources'
  get 'human_resources_sales' => 'jobchecks#human_resources_sales'
  get 'it_sales' => 'jobchecks#it_sales'
  get 'manufacturer_sales' => 'jobchecks#manufacturer_sales'
  get 'mr_sales' => 'jobchecks#mr_sales'
  get 'office_work' => 'jobchecks#office_work'
  get 'real_estate_sales' => 'jobchecks#real_estate_sales'
  get 'sales_staff' => 'jobchecks#sales_staff'
  get 'secretary' => 'jobchecks#secretary'
  get 'service_planning' => 'jobchecks#service_planning'
  get 'system_engineer' => 'jobchecks#system_engineer'
  get 'jobcheck_top' => 'jobchecks#jobcheck_top'
  get 'webad_sales' => 'jobchecks#webad_sales'
  get 'writer' => 'jobchecks#writer'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

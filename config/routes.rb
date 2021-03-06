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



  # 通知機能関連
  resources :notifications, only: :index



  # メッセージ機能関連
  resources :rooms, only: [:create,:show]
  # resources :messages, only: [:create]



  # トップページ関連
  root 'tops#top'
  get 'about' => 'tops#about'



  # 求人票関連
  resources :job_informations, only: [:new, :create, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end


  # タスク機能関連
  resources :tasks, only: [:new, :index, :create, :edit, :destroy, :update]



  # 職種診断用のページ
  get 'jobcheck/top' => 'jobchecks#top'
  get 'jobcheck/accounting' => 'jobchecks#accounting'
  get 'jobcheck/general_affairs' => 'jobchecks#general_affairs'
  get 'jobcheck/human_resources' => 'jobchecks#human_resources'
  get 'jobcheck/human_resources_sales' => 'jobchecks#human_resources_sales'
  get 'jobcheck/it_sales' => 'jobchecks#it_sales'
  get 'jobcheck/manufacturer_sales' => 'jobchecks#manufacturer_sales'
  get 'jobcheck/mr_sales' => 'jobchecks#mr_sales'
  get 'jobcheck/office_work' => 'jobchecks#office_work'
  get 'jobcheck/real_estate_sales' => 'jobchecks#real_estate_sales'
  get 'jobcheck/sales_staff' => 'jobchecks#sales_staff'
  get 'jobcheck/secretary' => 'jobchecks#secretary'
  get 'jobcheck/service_planning' => 'jobchecks#service_planning'
  get 'jobcheck/system_engineer' => 'jobchecks#system_engineer'
  get 'jobcheck/jobcheck_top' => 'jobchecks#jobcheck_top'
  get 'jobcheck/webad_sales' => 'jobchecks#webad_sales'
  get 'jobcheck/writer' => 'jobchecks#writer'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

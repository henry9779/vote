Rails.application.routes.draw do
  resources :candidates do
    member do #對路徑擴充
      post :vote #對路徑擴充會有id頁 做出/candidates/id/vote
    end #對路徑擴充
  end
end

  # collection do #對路徑擴充沒有id頁
  # post :vote
  # get :vote_list # 做出/candidates/id/vote_list
  # post '/candidates/:id/vote', to: 'candidates#vote'

Rails.application.routes.draw do
  root to: 'root#index'

  post 'company' => 'mail#mail_as_company'
  post 'reset_password' => 'mail#mail_reset_password'
  post 'campaign' => 'mail#mail_as_campaign'
  post 'campaign_many' => 'mail#mail_many_as_campaign'

  post 'unsubscribe' => 'unsubscribe#unsubscribe'
end

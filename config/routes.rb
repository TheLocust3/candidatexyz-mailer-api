Rails.application.routes.draw do
  post 'company' => 'mail#mail_as_company'
  post 'campaign' => 'mail#mail_as_campaign'
  post 'campaign_many' => 'mail#mail_as_campaign'
end

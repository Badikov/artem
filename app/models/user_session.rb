class UserSession < Authlogic::Session::Base  
  params_key :auth_token # tell Authlogic the authentication param name
  single_access_allowed_request_types :any
  logout_on_timeout true # default if false
  consecutive_failed_logins_limit 10 #лимит попыток залогиниться
  remember_me_for 2.weeks
end
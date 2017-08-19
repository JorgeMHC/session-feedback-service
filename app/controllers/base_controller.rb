class BaseController < ApplicationController
  include ErrorHandler

  def current_user
    User.find(request.headers["HTTP_UBI_USERID"])
  end
end

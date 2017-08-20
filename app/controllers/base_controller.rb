class BaseController < ApplicationController
  include ErrorHandler

  def current_user
    # rails attach HTTP_ to the header values as well as converting it to all caps
    User.find(request.headers["HTTP_UBI_USERID"])
  end
end

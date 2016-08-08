class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "hello, world!"
    # https://www.rio2016.com/en/medal-count-country
  end

end

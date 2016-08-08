class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Hello, Rio 2016 Olympic Games. Hello yyy."
    # https://www.rio2016.com/en/medal-count-country
  end

end

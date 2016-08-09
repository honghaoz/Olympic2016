class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render text: "Hello, Rio 2016 Olympic Games."
  end

end

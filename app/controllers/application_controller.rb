class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render text:
    '
      <h3>Rio 2016 Olympic Games - Medals API</h3>
      <a href="/api/medal_by_country">/api/medal_by_country</a>
    '
  end

end

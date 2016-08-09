class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render text:
    '
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <title>Rio 2016 Olympic Games - Medals API</title>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <script async defer src="https://buttons.github.io/buttons.js"></script>
        </head>

        <body>
          <h3>Rio 2016 Olympic Games - Medals API</h3>
          <a href="/api/medal_by_country">/api/medal_by_country</a>

          <br>
          <br>
          <a class="github-button" href="https://github.com/honghaoz/Olympic2016" data-icon="octicon-star" data-style="mega" data-count-href="/honghaoz/Olympic2016/stargazers" data-count-api="/repos/honghaoz/Olympic2016#stargazers_count" data-count-aria-label="# stargazers on GitHub" aria-label="Star honghaoz/Olympic2016 on GitHub">Star</a>
        </body>
      </html>
    '
  end

end

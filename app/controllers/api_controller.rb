class ApiController < ApplicationController
  def medal
    # https://www.rio2016.com/en/medal-count-country
    test_json = [
      'a': 1,
      'b': 2,
      'c': 3
      ]
    render json: test_json
  end
end

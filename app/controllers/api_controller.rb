require 'nokogiri'
require 'open-uri'

class ApiController < ApplicationController
  def medal
    medal_by_country
  end

  def medal_by_country
    url = "https://www.rio2016.com/en/medal-count-country"
    doc, error = read(url)

    medals_by_countries = []
    status = "OK"
    error_message = nil

    if doc
      medals_by_countries = doc.css("#ms-countries-medal-count .table-medal-countries__link-table").map do |country|
  	    rank = country.at_css(".col-1").text.strip!
  	    country_code = country.at_css(".col-2>.country").text
  	    country_name = country.at_css(".col-3>.country").text
  	    gold_count = country.at_css(".col-4").text
  	    silver_count = country.at_css(".col-5").text
  	    bronze_count = country.at_css(".col-6").text
  	    medal_count = country.at_css(".col-7").text

  	    {
  	      'rank': rank.to_i,
  	      'country_code': country_code,
  	      'country_name': country_name,
  	      'gold_count': gold_count.to_i,
  	      'silver_count': silver_count.to_i,
  	      'bronze_count': bronze_count.to_i,
  	      'medal_count': medal_count.to_i
  	    }
      end
    else
      status = "ERROR"
      error_message = error.message
    end

    result_dict = {
      'results': medals_by_countries,
      'status': status
    }

    if error_message
      result_dict["error_message"] = error_message
    end

    render json: result_dict
  end

  def read(url)
    begin
      return Nokogiri::HTML(open(url))
    rescue => e
      return nil, e
    end
  end

  private :read

end

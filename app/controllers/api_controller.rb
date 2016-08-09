require 'nokogiri'
require 'open-uri'

class ApiController < ApplicationController
  def medal
    medal_by_country
  end

  def medal_by_country
    url = "https://www.rio2016.com/en/medal-count-country"
    doc = Nokogiri::HTML(open(url))

    medals_by_countries = doc.css("#ms-countries-medal-count .table-medal-countries__link-table").map do |country|
	    rank = country.at_css(".col-1").text.strip!
	    country_code = country.at_css(".col-2>.country").text
	    country_name = country.at_css(".col-3>.country").text
	    gold_count = country.at_css(".col-4").text
	    silver_count = country.at_css(".col-5").text
	    bronze_count = country.at_css(".col-6").text
	    medal_count = country.at_css(".col-7").text
	    {
	      'rank': rank,
	      'country_code': country_code,
	      'country_name': country_name,
	      'gold_count': gold_count,
	      'silver_count': silver_count,
	      'bronze_count': bronze_count,
	      'medal_count': medal_count
	    }
    end

    meta_dict = {
      'status': 0
    }

    result_dict = {
      'medals': medals_by_countries,
      'meta': meta_dict
    }
    render json: result_dict
  end

end

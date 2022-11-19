class SubwaysController < ApplicationController

  def index
    response = Mbta::Search.get_subway_lines
    response_body = JSON.parse(response.body)

    if response.status == 200
      @data = response_body['data']
      @errors = []
    else
      @data = []
      @errors = response_body['errors'].map{|e| e['code']}
    end
  end

  def show
    response = Mbta::Search.get_stops(params[:id])
    response_body = JSON.parse(response.body)

    if response.status == 200
      @data = response_body['data']
      @errors = []
    else
      @data = []
      @errors = response_body['errors'].map{|e| e['code']}
    end
  end
end

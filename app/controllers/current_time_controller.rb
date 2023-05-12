# app/controllers/current_time_controller.rb
class CurrentTimeController < ApplicationController
 def current_time
  value = params[:timezone]
  timezone = URI.encode_www_form_component(value)
  if timezone.match?(/\AUTC[+-]\d+\z/i) and timezone[3..-1].to_i.between?(-12,14)
    offset = timezone[3..-1].to_i
    if timezone[3] == '+'
      time = Time.now.utc + offset.hours
    elsif timezone[3] == '-'
      time = Time.now.utc - offset.hours 
    end
    render status:200, json: {current_time: time.strftime("%Y-%m-%d %H:%M:%S")}
  else
   render status:400, json: {error: "Wrong Time Zone"}
  end
 end
end

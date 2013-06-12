class SpheroControlController < ApplicationController
  def enter_command
  end

  def set_color
    color, red, green, blue = params[:color].split(',')
    sphero.rgb(red.to_i, green.to_i, blue.to_i)
    redirect_to root_path, :notice => "Color set to #{color}"
  end

  def send_morse_code
    sphero.back_led_output = 0
    sphero.rgb(0,0,0)
    translated_string = MorseCode.new(params[:text])
    translated_string.to_morse.each do |morse_letter|
      Rails.logger.debug(morse_letter)
      morse_letter.split('').each do |dit_dah|
        next if dit_dah == ' '
        sphero.back_led_output = 255
        sleep(1)
        sleep(1) if dit_dah == '-'
        sphero.back_led_output = 0
      end
    end
    redirect_to root_path, :notice => "#{params[:text]} sent to sphero"
  end

end

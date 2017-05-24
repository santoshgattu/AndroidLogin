require 'selenium-webdriver'

module CommonFunctions
  #Explicit wait definition
  def wait_for(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

  # This method is used to generate random string
  def random_text_generator(txt)
    time = Time.now.to_i
    txt+"#{time}".to_s
  end

  # This method is used to get random Checkin string and push to scripts
  def getverifyrandstr
    $verify_text=random_text_generator("NewText")
  end

  def customizedwait
    sleep 5
  end

end
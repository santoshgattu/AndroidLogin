require './features/pages/login_page'
require $utilityPath+'/CommonFunctions'

include CommonFunctions

module Android
  class LoginPage < BaseLoginPage

    attr_reader :driver
    def initialize(driver)
      $and_mob_driver = driver
      super(driver)
    end

    def vrfyapplaunched
      apptitle = wait_for(20){$and_mob_driver.find_element(:id, XEBIALAUNCHPAGE[:title_from_header]).displayed?}
      puts "App with title #{LAUNCHPAGETESTDATA[:launchpagetitle]} launched successfully"
    end

    def clickappbutton(buttontoclick)
      wait_for(20){$and_mob_driver.find_element(:id, XEBIALAUNCHPAGE[:clickmebutton_id]).displayed?}
      $and_mob_driver.find_element(:id, XEBIALAUNCHPAGE[:clickmebutton_id]).click
      puts "App with title #{LAUNCHPAGETESTDATA[:launchpagetitle]} launched successfully"
    end

    def vrfytextdisplayed(texttoverify)
      wait_for(20){$and_mob_driver.find_element(:id, XEBIALAUNCHPAGE[:clickmebutton_id]).displayed?}
      wait_for(20){$and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:text_fielddisplayed_id]).displayed?}
      puts "Text #{texttoverify} successfully displayed"
    end

    def enterrandomtext()
      getverifyrandstr()
      textfieldtoenter = wait_for(20){$and_mob_driver.find_element(:id, XEBIALAUNCHPAGE[:texttoenter_field_id]).displayed?}
      textfieldtoenter.click
      textfieldtoenter.send_keys("AndroidAutomation")
      wait_for(20){$and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:text_fielddisplayed_id]).displayed?}
    end

    def clickseetestbtn(seetestbtn)
      puts "Button to click: #{seetestbtn}"
      wait_for(20){$and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:seedetails_btn_id]).displayed?}
      $and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:seedetails_btn_id]).click
    end

    # This method is used to obtain the title of the Details Activity Page
    def verifynavpagetitle(pagetitle)
      customizedwait
      displayedpagetitle = $and_mob_driver.find_element(:id, XEBIATIMEPICKERPAGE[:pagetitle_id]).text
      if displayedpagetitle==pagetitle
        puts "Actual page title #{displayedpagetitle} and Expected page title #{pagetitle} match"
      else
        raise "Expected page title #{pagetitle} but found actual title to be #{displayedpagetitle}"
      end
    end

    def verifytextdisplayedonnextpage
      wait_for(20){$and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:text_fielddisplayed_id]).displayed?}
      gettextdisplayed = $and_mob_driver.find_element(:xpath, XEBIALAUNCHPAGE[:text_fielddisplayed_id]).text

      puts "Value of text to be verified: #{gettextdisplayed}"
      pagetitle = "#{LAUNCHPAGETESTDATA[:titlettextdispbydefault]} "+"AndroidAutomation"
      puts "This is the new page title #{pagetitle}"
      if gettextdisplayed==pagetitle
        puts "Actual page title #{gettextdisplayed} and Expected page title #{pagetitle} match"
      else
        raise "Expected page title #{pagetitle} but found actual title to be #{gettextdisplayed}"
      end
    end

  end
end
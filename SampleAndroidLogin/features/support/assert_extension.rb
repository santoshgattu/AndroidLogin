# # Create a custom assertion class for UI testing
class AssertExtension
  def assert_displayed(element)
    assert_true(element.displayed?, 'Element should be displayed!')
  end

  def wait_maximum_10_seconds_for_an_element(id, timeout = 10)
    wait = Selenium::WebDriver::Wait.new :timeout => timeout
    wait.until { $driver.find_element(:id, id).displayed? }
  end

  def element_exists_by_id?(my_id)
    if $driver.find_elements(:id, my_id).size == 0
      false
    else
      true
    end
  end

end

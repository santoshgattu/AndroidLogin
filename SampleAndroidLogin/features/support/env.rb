require 'appium_lib'
require 'cucumber/ast'
require 'test/unit/assertions'
require 'selenium-webdriver'
require 'rspec'

def load_appium_configuration(platform)
  Appium.load_appium_txt :file => File.expand_path("./../../../config/#{platform}/appium.txt", __FILE__), verbose: true
end

def load_module(path)
  Dir[path].each { |file| require file }
end

# Create a custom World class so we don't pollute `Object` with Appium methods
class AppiumWorld

end

$root=Dir.pwd
$basepath=Dir.pwd+'/features'
$utilitypath=$basepath+'/utilities'

if ENV['PLATFORM_NAME'].nil?
  raise 'Please define the PLATFORM_NAME environment variable like: export PLATFORM_NAME=android'
else
  env = ENV['PLATFORM_NAME'].downcase
end

case env
# set env = android only when you wish to run 'Android' specific tests
when 'android'
  caps = load_appium_configuration(env)
  caps[:appium_lib][:export_session]=true
  load_module('./features/pages/android/*.rb')

  $ENV = Android
  Appium::Driver.new(caps)
  Appium.promote_appium_methods AppiumWorld
else
  raise("Not supported platform #{ENV['PLATFORM_NAME']}")
end

# world settings
World(Test::Unit::Assertions)

World do
  AppiumWorld.new
  AssertExtension.new
end

Before do |scenario|
  if $ENV == Android
    puts "Starting Android driver"
    $driver.start_driver
  else
    raise("Something went wrong")
  end
end

After do |scenario|
  if scenario.failed?
    puts "Test case failed"
    if $ENV == Android
      puts "capturing screenshot for Android device"
      $driver.screenshot("#{$root}/screenshots/ErrorAndroiddevice.png")
      $driver.driver_quit
    end
  end
end

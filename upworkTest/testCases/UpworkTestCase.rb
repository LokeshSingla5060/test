require "test/unit"
require 'selenium-webdriver'
require '../libraryUtils/DriverManager'
require '../libraryUtils/FileManager'
require '../entities/DemoTestData'
require '../BusinessUtilities/TestCase'
require 'yaml'
require 'logger'
require 'date'

class UpworkTest < Test::Unit::TestCase

def test_upwork
    
    #define objects
    @config = YAML.load_file('../config/environmentConfig.yml')
    @test_Data= YAML.load_file('../config/testData.yml')
    driverManager =DriverManager::UIDriver.new
    @demo_data = DemoTestData.new

    #define log object
    log = Logger.new(FileManager.new.createFile('../logs')+'/'+'log.txt')
    log.info "############ Test Case testCase001 Execution started ############"

    #set the test Data
    @demo_data.browser_name=@config['browser_name']
    log.info "Test Data is set for browser name : "+@demo_data.browser_name.to_s
    @demo_data.app_url=@config['app_url']
    log.info "Test Data is set for application url : "+@demo_data.app_url.to_s
    @demo_data.freelancer_keyword=@test_Data['keyword']
    log.info "Test Data is set for keyword : "+@demo_data.freelancer_keyword.to_s

    #define webdriver instance
    log.info "Initializing WebDriver instance"
    driver =driverManager.initiateDriver(@demo_data,log)
    log.info "WebDriver instance is initialized"
    @locators= YAML.load_file('../objectRepository/locatorValue.yml')


    #verify Upwork title
    log.info "Verify Upwork Title"
    homePage = TestCase.new(driver)
    assert_equal 'Upwork',homePage.fetchElement(@demo_data,log,'upworkTitle'), "It should return a string called 'Upwork'"

    log.info "Verify Post A Job button"
    #if Post a job button is displayed
    isPostAJobButtonDisplayed=homePage.webElementDisplayed(@demo_data,log,'postAJob').displayed?
    #do assertion on Post a job button link
    assert_equal(true,isPostAJobButtonDisplayed,'Post a Job button display')

    log.info "Verify Login Link"
    isLoginLinkDisplayed=homePage.webElementDisplayed(@demo_data,log,'loginLink').displayed?
    assert_equal(true,isLoginLinkDisplayed,'Login link display')

    log.info "Verify SignUp Link"
    isSignUpLinkDisplayed=homePage.webElementDisplayed(@demo_data,log,'signUpLink').displayed?
    assert_equal(true,isSignUpLinkDisplayed,'SignUp link display')

    log.info "Verify Search TextField"
    isSearchTextFieldDisplayed=homePage.webElementDisplayed(@demo_data,log,'searchTextField').displayed?
    assert_equal(true,isSearchTextFieldDisplayed,'Search textfield display')

    log.info "Verify Web Dev Link"
    isWebDevLinkDisplayed=homePage.webElementDisplayed(@demo_data,log,'webDevLink').displayed?
    assert_equal(true,isWebDevLinkDisplayed,'Web Dev link display')

    #scroll down
    sleep 0.50
    log.info "Scroll Down to bottom of the page"
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")

    #Verify the content at the bootom of the page
    log.info "Verify Upwork Global Text"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'upWorkGlobalText').displayed?,'Upwork Global Text display')

    log.info "Verify facebook link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'facebookLink').displayed?,'facebook link display')

    log.info "Verify linkedIn link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'linkedInLink').displayed?,'LinkedIn link display')

    log.info "Verify twitter link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'twitterLink').displayed?,'Twitter link display')

    log.info "Verify youtube link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'youtubeLink').displayed?,'Youtube link display')

    log.info "Verify instagram link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'instagramLink').displayed?,'Instagram link display')

    log.info "Verify appleStore link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'appleStoreLink').displayed?,'Apple store link display')

    log.info "Verify playStore link"
    assert_equal(true,homePage.webElementDisplayed(@demo_data,log,'playStoreLink').displayed?,'Play store link display')
    
    log.info "All Links are verified successfully"

    #close browser
    driver.close
    log.info "############ Test Case testCase001 Execution completed ############"

end

# search.searchFreeLancer(@demo_data,log)

# #verify the main data is present on the home page
#   def test_upwork
#     assert_equal ' Upwork ',@driver.find_element(:xpath,@locators['upworkTitle']).text, "Hello.world should return a string called 'world'"
#   end

  
end
require 'selenium-webdriver'
require 'yaml'

class TestCase
    def initialize(driver)
        @driver=driver
    end

    #return text fo WebElement
    def fetchElement(testData,log,locator)
        begin
            @locators= YAML.load_file('../objectRepository/locatorValue.yml')
            title=@driver.find_element(:xpath,@locators[locator]).text
            return title.to_s
        rescue StandardError => e  
            puts e.message  
            log.error e.message
        end

    end

    #return text fo WebElement
    def webElementDisplayed(testData,log,locator)
        begin
            @locators= YAML.load_file('../objectRepository/locatorValue.yml')
            title=@driver.find_element(:xpath,@locators[locator])
            return title
        rescue StandardError => e  
            puts e.message  
            log.error e.message
        end

    end

    



end

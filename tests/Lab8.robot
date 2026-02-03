*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Test Cases ***
Open Computing KKU Website
    Open Browser To Login Page
    Sleep    2s

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th

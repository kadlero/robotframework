*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en/login
${BROWSER}     Chrome
${EMAILINPUT}  xpath=//*[@id='login']
${PASSWORDINPUT}   xpath=//*[@id='password']
${SIGNINBUTTON}    xpath=//*[text()='Sign in']
${PAGELOGO}        xpath=//*[contains(@title, 'Logo')]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user03@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element   ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot      ${OUTPUTDIR}/selenium-screenshot-1.png

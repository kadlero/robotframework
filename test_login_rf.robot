*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en/login
${BROWSER}     Chrome
${EMAILINPUT}  xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${INVALIDEMAILORPASSWORD}   //span[contains(text(),'Identifier or password invalid.')]
${SIGNINBUTTON}    xpath=//*[text()='Sign in']
${LANGUAGELISTBOX}      xpath=//body/div[@id='__next']/form[1]/div[1]/div[2]/div[1]/*[1]
${ENGLISHLANGUAGE}      xpath=//*[@data-value='en']
${ENGLISHLANGUAGECHECK}      xpath=//div[contains(text(),'English')]
${REMINDPASSWORD}       xpath=//a[contains(text(),'Remind password')]
${EMAILINPUTREMIND}     xpath=//*[@name='email']
${SENDBUTTONREMIND}     xpath=//span[contains(text(),'Send')]
${POPUPREMIND}      xpath=//div[contains(text(),'Message sent successfully.')]
${PAGELOGO}        xpath=//*[contains(@title, 'Logo')]
${MAINADDPLAYER}        xpath=//span[contains(text(),'Add player')]
${ADDPLAYEREMAIL}       xpath=//*[@name='email']
${ADDPLAYERNAME}       xpath=//*[@name='name']
${ADDPLAYERSURNAME}     xpath=//*[@name='surname']
${ADDPLAYERPHONE}       xpath=//*[@name='phone']
${ADDPLAYERWEIGHT}      xpath=//*[@name='weight']
${ADDPLAYERHEIGHT}      xpath=//*[@name='height']
${ADDPLAYERAGE}      xpath=//*[@name='age']
${ADDPLAYERLEG}     xpath=//*[@name='leg']
${ADDPLAYERMAINPOSITION}        xpath=//*[@name='mainPosition']
${ADDPLAYERSUBMITBUTTON}        xpath=//span[contains(text(),'Submit')]


*** Test Cases ***
Login to the system valid
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Click On The Submit Button
    Assert Dashboard
    [Teardown]    Close Browser

Login to the system invalid
    Open Login Page
    Type In Email Invalid
    Type In Password Invalid
    Click On The Submit Button
    Assert Incorrect Login
    [Teardown]    Close Browser

Login to the system language selection
    Open Login Page
    Click On The Language Listbox
    Click On The English Language
    Assert English Language
    [Teardown]    Close Browser

Login to the system remind password
    Open Login Page
    Click On The Remind Password
    Type In Email Remind
    Click On The Send Button Remind
    Assert Remind Password
    [Teardown]    Close Browser

Add a player valid
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Click On The Submit Button
    Click On The Add Player


*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type In Email Valid
    Input Text   ${EMAILINPUT}   user03@getnada.com
Type In Email Invalid
    Input Text   ${EMAILINPUT}   plainadress
Type In Email Remind
    Input Text   ${EMAILINPUTREMIND}   user03@getnada.com
Type In Password Valid
    Input Text   ${PASSWORDINPUT}   Test-1234
Type In Password Invalid
    Input Text   ${PASSWORDINPUT}   1234
Click On The Submit Button
    Click Element   ${SIGNINBUTTON}
Click On The Send Button Remind
    Click Element   ${SENDBUTTONREMIND}
Click On The Language Listbox
    Click Element   ${LANGUAGELISTBOX}
Click On The English Language
    Click Element   ${ENGLISHLANGUAGE}
Click On The Remind Password
    Click Element   ${REMINDPASSWORD}
Click On The Add Player
    Click Element   ${MAINADDPLAYER}
Assert Dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot      ${OUTPUTDIR}/selenium-screenshot-1.png
Assert Incorrect Login
    Wait Until Element Is Visible    ${INVALIDEMAILORPASSWORD}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-2.png
Assert English Language
    Wait Until Element Is Visible    ${ENGLISHLANGUAGECHECK}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-3.png
Assert Remind Password
    Wait Until Element Is Visible    ${POPUPREMIND}
    Title Should Be    Remind password
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-4.png




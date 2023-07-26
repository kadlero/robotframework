*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website

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
${ADDPLAYERHEADER}      xpath=//span[contains(text(),'Add player')]
${ADDPLAYEREMAIL}       xpath=//*[@name='email']
${ADDPLAYERNAME}       xpath=//*[@name='name']
${ADDPLAYERSURNAME}     xpath=//*[@name='surname']
${ADDPLAYERPHONE}       xpath=//*[@name='phone']
${ADDPLAYERWEIGHT}      xpath=//*[@name='weight']
${ADDPLAYERHEIGHT}      xpath=//*[@name='height']
${ADDPLAYERAGE}      xpath=//*[@name='age']
${ADDPLAYERLEG}     xpath=//*[@id='mui-component-select-leg' and @role='button']
${ADDPLAYERRIGHTLEG}        xpath=//*[@data-value='right']
${ADDPLAYERLEFTLEG}     xpath=//*[@data-value='left']
${ADDPLAYERMAINPOSITION}        xpath=//*[@name='mainPosition']
${ADDPLAYERSUBMITBUTTON}        xpath=//span[contains(text(),'Submit')]
${POPUPADDEDPLAYER}     xpath=//div[contains(text(),'Added player.')]
${MAINPAGEFIELD}        xpath=//span[contains(text(),'Main page')]
${LASTCREATEDPLAYER}        xpath=//span[contains(text(),'Lulek Mordęga')]
${REQUIREDFIELD}        xpath=//*[text()='Required']
${ADDPLAYERLEFTLEG}     xpath=//*[text()='Left leg']
${DEVTEAMCONTACTBUTTON}       xpath=//span[contains(text(),'Dev team contact')]
${SLACKLOGO}        xpath=//header/div[2]/a[1]/img[1]


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
    Wait Until Logo Appears
    Click On The Add Player
    Wait Until Add Player Header Appears
    Type In Add Player Email
    Type In Add Player Name
    Type In Add Player Surname
    Type In Add Player Phone
    Type In Add Player Weight
    Type In Add Player Height
    Type In Add Player Age
    Type In Add Player Main Position
    Click On The Add Player Submit Button
    Wait Until Added Player Message Appears
    Click On The Main Page Field
    Assert Player Added
    [Teardown]    Close Browser

Add a player invalid
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Click On The Submit Button
    Wait Until Logo Appears
    Click On The Add Player
    Wait Until Add Player Header Appears
    Type In Add Player Email
    Click On The Add Player Submit Button
    Click On The Add Player Submit Button
    Scroll Element Into Header
    Assert Required Field
    [Teardown]    Close Browser

Add a player leg
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Click On The Submit Button
    Wait Until Logo Appears
    Click On The Add Player
    Wait Until Add Player Header Appears
    Click On The Leg Field
    Click On The Right Leg Field
    Wait Until Leg Field Appears
    Click On The Leg Field
    Click On The Left Leg Field
    Wait Until Leg Field Appears
    Assert Left Leg Field
    [Teardown]    Close Browser

Dev team contact form
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Click On The Submit Button
    Wait Until Logo Appears
    Click On The Dev Team Contact Button
    Assert Dev Team Contact
    [Teardown]    Close Browser




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
Type In Add Player Email
    Input Text   ${ADDPLAYEREMAIL}   user04@getnada.com
Type In Add Player Name
    Input Text   ${ADDPLAYERNAME}   Lulek
Type In Add Player Surname
    Input Text   ${ADDPLAYERSURNAME}   Mordęga
Type In Add Player Phone
    Input Text   ${ADDPLAYERPHONE}   999888777
Type In Add Player Weight
    Input Text   ${ADDPLAYERWEIGHT}   45
Type In Add Player Height
    Input Text   ${ADDPLAYERHEIGHT}   160
Type In Add Player Age
    Input Text   ${ADDPLAYERAGE}   11072012
Type In Add Player Main Position
    Input Text   ${ADDPLAYERMAINPOSITION}   Attacker
Click On The Leg Field
    Click Element       ${ADDPLAYERLEG}
Click On The Right Leg Field
    Click Element       ${ADDPLAYERRIGHTLEG}
Click On The Left Leg Field
    Click Element       ${ADDPLAYERLEFTLEG}
Click On The Add Player Submit Button
    Click Element       ${ADDPLAYERSUBMITBUTTON}
Click On The Dev Team Contact Button
    Click Element       ${DEVTEAMCONTACTBUTTON}
Wait Until Logo Appears
    Wait Until Element Is Visible   ${PAGELOGO}
Wait Until Add Player Header Appears
    Wait Until Element Is Visible   ${ADDPLAYERHEADER}
Wait Until Added Player Message Appears
    Wait Until Element Is Visible       ${POPUPADDEDPLAYER}
Wait Until Leg Field Appears
    Wait Until Element Is Visible       ${ADDPLAYERLEG}
Click On The Main Page Field
    Click Element       ${MAINPAGEFIELD}
Scroll Element Into Header
    Scroll Element Into View    ${MAINADDPLAYER}
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
Assert Player Added
    Wait Until Element Is Visible    ${LASTCREATEDPLAYER}
    Title Should Be     Edit player Lulek Mordęga
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-5.png
Assert Required Field
    Wait Until Element Is Visible       ${REQUIREDFIELD}
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-6.png
Assert Left Leg Field
    Wait Until Element Is Visible       ${ADDPLAYERLEFTLEG}
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-7.png
Assert Dev Team Contact
    Wait Until Element Is Visible       ${SLACKLOGO}
    Title Should Be    Dev team contact form
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-8.png
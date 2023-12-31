*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/
${SLACK}        https://app.slack.com/workspace-signin?redir=%2Fgantry%2Fauth%3Fapp%3Dclient%26lc%3D1690378834%26return_to%3D%252Fclient%252FT3X4CAKNU%252FC3XTEGXB6%26teams%3DTASA2Q716
${BROWSER}     Chrome
${EMAILINPUT}  xpath=//*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${INVALIDEMAILORPASSWORD}   //span[contains(text(),'Identifier or password invalid.')]
${SIGNINBUTTON}    xpath=//*[text()='Sign in']
${LANGUAGELISTBOX}      xpath=//body/div[@id='__next']/form[1]/div[1]/div[2]/div[1]/*[1]
${POLISHLANGUAGE}       xpath=//body/div[@id='menu-']/div[3]/ul[1]/li[1]
${ENGLISHLANGUAGE}      xpath=//*[@data-value='en']
${ENGLISHLANGUAGECHECK}      xpath=//div[contains(text(),'English')]
${ENGLISHLANGUAGEHEADER}        xpath=//*[@id="__next"]/form/div/div[1]/h5
${REMINDPASSWORD}       xpath=//a[contains(text(),'Remind password')]
${EMAILINPUTREMIND}     xpath=//*[@name='email']
${SENDBUTTONREMIND}     xpath=//span[contains(text(),'Send')]
${POPUPREMIND}      xpath=//div[contains(text(),'Message sent successfully.')]
${PAGELOGO}        xpath=//*[contains(@title, 'Logo')]
${SCOUTSPANELHEADER}        xpath=//h2[contains(text(),'Scouts Panel')]
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
${SLACKLOGO}        xpath=//*[contains(@title, 'Slack')]


*** Test Cases ***
Login to the system valid
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Wait Until Sign In Button Appears
    Click On The Sign In Button
    Assert Dashboard
    Assert Scouts Panel Header
    [Teardown]    Close Browser

Login to the system invalid
    Open Login Page
    Type In Email Invalid
    Type In Password Invalid
    Wait Until Sign In Button Appears
    Click On The Sign In Button
    Assert Incorrect Login
    [Teardown]    Close Browser

Login to the system language selection
    Open Login Page
    Click On The Language Listbox
    Click On The Polish Language
    Click On The Language Listbox
    Click On The English Language
    Assert English Language Header
    Assert English Language
    [Teardown]    Close Browser

Login to the system remind password valid
    Open Login Page
    Click On The Remind Password
    Wait Until Remind E-mail Appears
    Type In Email Remind
    Click On The Send Button Remind
    Assert Remind Password
    [Teardown]    Close Browser

Login to the system remind password invalid
    Open Login Page
    Click On The Remind Password
    Wait Until Remind E-mail Appears
    Type In Email Remind Invalid
    Click On The Send Button Remind
    Assert Remind Password Invalid
    [Teardown]    Close Browser

Add a player valid
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Wait Until Sign In Button Appears
    Click On The Sign In Button
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
    Wait Until Sign In Button Appears
    Click On The Sign In Button
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
    Wait Until Sign In Button Appears
    Click On The Sign In Button
    Wait Until Logo Appears
    Click On The Add Player
    Wait Until Add Player Header Appears
    Click On The Leg Field
    Click On The Right Leg Field
    Wait Until Leg Field Appears
    Click On The Leg Field
    Wait Until Left Leg Field Appears
    Click On The Left Leg Field
    Wait Until Leg Field Appears
    Assert Leg Field
    [Teardown]    Close Browser

Dev team contact form
    Open Login Page
    Type In Email Valid
    Type In Password Valid
    Wait Until Sign In Button Appears
    Click On The Sign In Button
    Wait Until Logo Appears
    Click On The Dev Team Contact Button
    Open Slack Link
    Assert Dev Team Contact
    [Teardown]    Close Browser

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Open Slack Link
    Open Browser        ${SLACK}    ${BROWSER}
Type In Email Valid
    Input Text   ${EMAILINPUT}   user03@getnada.com
Type In Email Invalid
    Input Text   ${EMAILINPUT}   plainadress
Type In Email Remind
    Input Text   ${EMAILINPUTREMIND}   user03@getnada.com
Type In Email Remind Invalid
    Input Text   ${EMAILINPUTREMIND}   plainadress
Type In Password Valid
    Input Text   ${PASSWORDINPUT}   Test-1234
Type In Password Invalid
    Input Text   ${PASSWORDINPUT}   1234
Click On The Sign in Button
    Click Element   ${SIGNINBUTTON}
Click On The Send Button Remind
    Click Element   ${SENDBUTTONREMIND}
Click On The Language Listbox
    Click Element   ${LANGUAGELISTBOX}
Click On The Polish Language
    Click Element   ${POLISHLANGUAGE}
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
Wait Until Sign In Button Appears
     Wait Until Element Is Visible      ${SIGNINBUTTON}
Wait Until Logo Appears
    Wait Until Element Is Visible   ${PAGELOGO}
Wait Until Add Player Header Appears
    Wait Until Element Is Visible   ${ADDPLAYERHEADER}
Wait Until Added Player Message Appears
    Wait Until Element Is Visible       ${POPUPADDEDPLAYER}
Wait Until Leg Field Appears
    Wait Until Element Is Visible       ${ADDPLAYERLEG}
Wait Until Left Leg Field Appears
    Wait Until Element Is Visible       ${ADDPLAYERLEFTLEG}
Wait Until Logo Slack Appears
    Wait Until Element Is Visible       ${SLACKLOGO}
Wait Until Remind E-mail Appears
    Wait Until Element Is Visible       ${EMAILINPUTREMIND}
Click On The Main Page Field
    Click Element       ${MAINPAGEFIELD}
Scroll Element Into Header
    Scroll Element Into View    ${MAINADDPLAYER}
Assert Dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot      ${OUTPUTDIR}/selenium-screenshot-1.png
Assert Scouts Panel Header
    Wait Until Element Is Visible    ${SCOUTSPANELHEADER}
    Get Text        Scouts Panel
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-2.png
Assert Incorrect Login
    Wait Until Element Is Visible    ${INVALIDEMAILORPASSWORD}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-3.png
Assert English Language
    Wait Until Element Is Visible    ${ENGLISHLANGUAGECHECK}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-4.png
Assert English Language Header
    Wait Until Element Is Visible    ${ENGLISHLANGUAGEHEADER}
    Get Text        Scouts Panel
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-5.png
Assert Remind Password
    Wait Until Element Is Visible    ${POPUPREMIND}
    Title Should Be    Remind password
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-6.png
Assert Remind Password Invalid
    Wait Until Element Is Visible    ${POPUPREMIND}
    Get Text        Sorry, we don't recognize that email
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-6.png
Assert Player Added
    Wait Until Element Is Visible    ${LASTCREATEDPLAYER}
    Title Should Be     Edit player Lulek Mordęga
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-7.png
Assert Required Field
    Wait Until Element Is Visible       ${REQUIREDFIELD}
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-8.png
Assert Leg Field
#    Wait Until Element Is Visible       ${ADDPLAYERLEG}
    Title Should Be     Add player
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-9.png
Assert Dev Team Contact
    Wait Until Page Contains Element        ${SLACKLOGO}
    Title Should Be    Dev team contact form
    Capture Page Screenshot     ${OUTPUTDIR}/selenium-screenshot-10.png
*** Settings ***
Documentation   Tämä on tiedosto, joka sisältää Conduit-websivulle https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#! suoritettavia testitapauksia.
...             Testauksen kohteena ovat sisäänkirjautuminen, uloskirjautuminen ja uuden artikkelin luominen. 
...             Testit on suunniteltu siten, että jos sivu toimii kuten pitää, ne menevät läpi.
...               
Library         SeleniumLibrary
Suite Setup     Open Browser To Front Page
Test Setup      Open Browser To Login Page
Test Teardown   Close Browser
Suite Teardown  Close Browser
Resource        resource.robot

*** Test Cases ***
Valid Login
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

Invalid Username
    Input Username  invalid@gmail.com
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Login Should Have Failed    

Invalid Password
    Input Username  ${VALID USER}
    Input Password  Invalid
    Submit Credentials
    Login Should Have Failed

Valid Logout
    Valid Login
    Click Element   css=[href="#!settings"]
    Settings Page Should Be Open
    Click Element   css=[class="btn btn-outline-danger"]
    Front Page Should Be Open

Creating New Post Succeed
    Valid Login
    Click Element   css=[href="#!editor/"]
    Editor Page Should Be Open
    Add Title
    Add About
    Add Body
    Click Element   css=[class="btn btn-lg btn-primary pull-xs-right"]
    Article Page Should Be Open
   
*** Keywords ***
Login Should Have Failed
    Login Page Should Be Open

Valid Login
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open


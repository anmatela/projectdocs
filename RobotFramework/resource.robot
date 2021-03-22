*** Settings ***
Documentation     Tämä on resurssitiedosto, joka sisältää testitapauksissa kierrätettävät avainsanat ja muuttujat.
...
...               Tässä luodut avainsanat perustuvat SeleniumLibraryn valmiiksi määriteltyihin avainsanoihin. 
Library           SeleniumLibrary

*** Variables ***
${BROWSER}          Chrome
${DELAY}            2
${VALID USER}       anmatela@gmail.com
${VALID PASSWORD}   annatestaa
${FRONTPAGE URL}    https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#!
${LOGIN URL}        https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#!login
${WELCOME URL}      https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#!home/personal
${SETTINGS URL}     https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#!settings
${EDITOR URL}       https://gothinkster.github.io/clojurescript-keechma-realworld-example-app/#!editor/
${TITLETEXT}        This Is Some Article Title For Testing
${ABOUTTEXT}        Here is some random text for "What Is This Article About field"...
${BODYTEXT}         Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vitae est nisl. Ut sed dignissim erat, nec lobortis sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque vel eros egestas, eleifend diam sed, pharetra sapien. Etiam bibendum lacus vitae purus dignissim scelerisque. Integer non nisi condimentum, accumsan mi id, interdum tellus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sit amet nibh diam. Morbi lobortis, ligula ac mattis tempor, lacus eros rutrum tellus, eget pretium eros dolor quis velit. Curabitur varius imperdiet enim, ut pellentesque sapien accumsan a. Donec vel lacinia eros. In hac habitasse platea dictumst. Suspendisse eleifend vitae odio nec posuere. Cras nec tempor purus. Nullam scelerisque, velit at commodo cursus, dolor diam sollicitudin ex, at interdum felis elit id diam. Suspendisse malesuada commodo sapien, vel facilisis tellus cursus eget. In hac habitasse platea dictumst. Morbi dictum cursus tellus, id varius neque scelerisque scelerisque. Aenean urna sapien, pulvinar nec condimentum eget, bibendum sit amet turpis. Pellentesque odio mi, vulputate nec magna sed, sodales tristique tellus. Curabitur et eleifend ante, a vulputate ex. Maecenas dignissim tortor non tortor elementum, vel egestas dui vulputate. Donec pulvinar metus elit, ac condimentum erat hendrerit eu. Pellentesque elementum neque at ultrices tristique. In hac habitasse platea dictumst. Phasellus eleifend sodales lorem, eu lacinia velit finibus quis. Sed convallis neque ac fermentum tempor. Quisque luctus lacinia scelerisque. Etiam vel accumsan purus, auctor interdum lectus. Aliquam ornare nulla ut augue auctor, in mattis purus pulvinar. Suspendisse at pulvinar diam. Phasellus id sodales arcu, a blandit augue. Pellentesque sodales turpis nunc, a varius ex tempor at. Praesent sit amet feugiat elit. Nulla at mi blandit ligula tincidunt bibendum. Ut pellentesque feugiat euismod. Curabitur dignissim urna sed ante porttitor pulvinar. Curabitur vehicula id ipsum in scelerisque. Duis consectetur, purus vel gravida ullamcorper, enim nisi gravida tellus, ac pulvinar diam risus ut neque. Integer luctus imperdiet dictum. Aliquam at lectus eu velit vulputate consectetur dictum sit amet mauris. Maecenas congue maximus arcu, sed volutpat mi porta vel. Vestibulum porttitor felis nec est ullamcorper aliquam. Integer gravida imperdiet nunc ac tincidunt. Maecenas tempus sapien imperdiet nisl aliquam, eget feugiat purus porttitor.

*** Keywords ***
Open Browser To Front Page
    Open Browser    ${FRONTPAGE URL}    ${BROWSER}
    Maximize Browser Window
    Front Page Should Be Open

Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain    Sign in

Settings Page Should Be Open
    Location Should Be      ${SETTINGS URL}

Front Page Should Be Open
    Location Should Be      ${FRONTPAGE URL}

Editor Page Should Be Open
    Location Should Be      ${EDITOR URL}

Article Page Should Be Open
    Page Should Contain      Edit Article

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text         css=[placeholder="Email"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     css=[type="password"]    ${password}

Submit Credentials
    Click Button       css=[class="btn btn-lg btn-primary pull-xs-right"]
    Set Selenium Speed    ${DELAY}

Welcome Page Should Be Open
    Page Should Contain    annam
    Location Should Be    ${WELCOME URL}

Add Title
    Input Text      css=[placeholder="Article Title"]   ${TITLETEXT}

Add About
    Input Text      css=[placeholder="What's this article about?"]     ${ABOUTTEXT}

Add Body
    Input Text      css=[placeholder="Write your article (in markdown)"]    ${BODYTEXT} 


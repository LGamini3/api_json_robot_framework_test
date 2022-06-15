*** Settings ***
Resource    ../../../../testdata/variables/import.resource
Resource    ../../../../keywords/import.resource

Library    RequestsLibrary
Library    ../../../../lib/json_validate_schema.py

Test Template    Custom Test Template
*** Test Cases ***                                            username    password
Verify login with wrong password Returns 401                  admin       wrongPass

Verify login with wrong user Returns 401                      user        masterPass

Verify login with Empty Date Returns 401                      ${EMPTY}    ${EMPTY}

Verify login with wrong user and password Returns 401         guest        wrongPass
*** Keywords ***
Custom Test Template
    [Arguments]    ${username}    ${password}
    Log to Console    \nSending Request To ${GLOBAL_ENDPOINT_LOGIN}\n
    &{jsonBody}    Create Dictionary    username=${username}    password=${password}
    ${response}    POST    url=${GLOBAL_ENDPOINT_LOGIN}    json=${jsonBody}    expected_status=401
    Validate Schema    inputJson=${response.json()}    referenceSchemaPath=${GLOBAL_SCHEMA_ERROR}


*** Settings ***
Resource    ../../../../testdata/variables/import.resource
Resource    ../../../../keywords/import.resource
Resource    ../../../../keywords/setupTeardowns.robot

Suite Setup    Authorize

*** Test Cases ***
Verify All users
    Log To Console    \nSending request to ${GLOBAL_ENDPOINT_USERS}\n
    ${params}    Create Dictionary    filter=all
    ${response}    GET    url=${GLOBAL_ENDPOINT_USERS}    expected_status=200    headers=${GLOBAL_AUTH_HEADER}    params=${params}
    Validate Schema    inputJson=${response.json()}    referenceSchemaPath=${GLOBAL_SCHEMA_USERS}
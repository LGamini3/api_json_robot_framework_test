*** Settings ***
Resource    ../../../../testdata/variables/import.resource
Resource    ../../../../keywords/import.resource
Resource    ../../../../keywords/setupTeardowns.robot

Suite Setup    Authorize

*** Test Cases ***
Verify Existing users
    ${response}    GET    ${GLOBAL_ENDPOINT_USERS}/1    expected_status=200    headers=${GLOBAL_AUTH_HEADER}
    Validate Schema   inputJson=${response.json()}    referenceSchemaPath=${GLOBAL_SCHEMA_USERS_ID}

*** Settings ***
Resource    ../../../../testdata/variables/import.resource

Library    RequestsLibrary
Library    ../../../../lib/json_validate_schema.py

*** Test Cases ***
Verify login Returns 200
    Log to Console    \nSending Request To ${GLOBAL_ENDPOINT_LOGIN}\n
    &{jsonBody}    Create Dictionary    username=admin    password=masterPass
    ${response}    POST    url=${GLOBAL_ENDPOINT_LOGIN}    json=${jsonBody}    expected_status=200
    Validate Json Schema    input_json=${response.json()}    reference_schema_path=${GLOBAL_SCHEMA_LOGIN}

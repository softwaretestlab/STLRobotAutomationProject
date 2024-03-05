*** Settings ***
Library               RequestsLibrary
Library     Collections

*** variables ***
${base_url}     https://reqres.in/api/users
#get
${page_num}     2
#post
${expectedname}    john
${expectedjob}     test manager
#put
${updated_expectedname}     update_test
${updated_expectedjob}      resident

*** Test Cases ***
Get Request Test
    ${response}=    GET    ${base_url}    params=page=${page_num}    expected_status=200
    Log to console    ${response.json()}
    Log to console    ${response.json()}[data][0][id]
#    response assertion
    Should be equal as strings    6    ${response.json()}[per_page]
    Should be equal as strings    12    ${response.json()}[total]
    Should be equal as strings    7    ${response.json()}[data][0][id]

Post Request Test
     &{req_body}=    Create dictionary    name=${expectedname}    job=${expectedjob}
     ${response}=    POST    ${base_url}    json=${req_body}    expected_status=201
     Log to console    ${response.json()}
     Dictionary Should Contain Key     ${response.json()}     id
     ${name}=    Get From Dictionary     ${response.json()}    name
     Should Be Equal As Strings    ${expectedname}   ${name}
     ${job}=    Get From Dictionary     ${response.json()}    job
     Should Be Equal As Strings    ${expectedjob}    ${job}

Put Request Test
    &{req_body}=  Create Dictionary    name=update_test        job=resident
    ${response}=     PUT        ${base_url}+/2     json=${req_body}    expected_status=200
    log      ${response.json()}

    Dictionary Should Contain Key     ${response.json()}     name
    ${name}=    Get From Dictionary     ${response.json()}    name
    Should Be Equal As Strings    ${updated_expectedname}    ${name}

    Dictionary Should Contain Key     ${response.json()}     job
    ${job}=    Get From Dictionary     ${response.json()}    job
    Should Be Equal As Strings    ${updated_expectedjob}    ${job}

Delete Request Test
    ${delete_resp}=   DELETE    ${base_url}+/2           expected_status=204

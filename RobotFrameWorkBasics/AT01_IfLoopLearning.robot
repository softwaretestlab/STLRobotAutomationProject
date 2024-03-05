
*** Variables ***
${MyNum}    30


*** Test Cases ***
Example:1
    IF    ${MyNum} < 20
        Log to console    Number is smaller
    ELSE
        Log to console    Number is bigger
    END

Example:2

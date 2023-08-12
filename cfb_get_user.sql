DELIMITER // 

CREATE PROCEDURE CFB_GET_USER (
    IN IN_USERNAME VARCHAR(32),
    IN_PW VARCHAR(32)
)

BEGIN

    SELECT
        U.*
    FROM
        CFB_USERS U
    WHERE
        U.USERNAME = IN_USERNAME
            AND
        U.PW = IN_PW;

END //

DELIMITER ;
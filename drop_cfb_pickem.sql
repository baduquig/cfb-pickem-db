delimiter //

CREATE PROCEDURE DROP_CFB_PICKEM()

BEGIN

    DROP TABLE IF EXISTS CFB_USER_PICKS;
    DROP TABLE IF EXISTS CFB_USERS;
    DROP TABLE IF EXISTS CFB_GAMES;
    DROP TABLE IF EXISTS CFB_SCHOOLS;
    DROP TABLE IF EXISTS CFB_LOCATIONS;
    DROP TABLE IF EXISTS CFB_CONFERENCES;    

END //

delimiter ;
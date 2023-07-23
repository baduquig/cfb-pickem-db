delimiter //

CREATE PROCEDURE CREATE_CFB_PICKEM()

BEGIN

    -- Create Locations
    CREATE TABLE IF NOT EXISTS CFB_LOCATIONS (
        LOCATION_ID         TINYINT         UNSIGNED    NOT NULL,
        LOCATION_NAME       VARCHAR(64)     NULL,
        CITY                VARCHAR(32)     NULL,
        STATE_NAME          CHAR(2)         NULL,
        LATITUDE            FLOAT(10, 7)    NULL,
        LONGITUDE           FLOAT(10, 7)    NULL,

        PRIMARY KEY (LOCATION_ID)
    );

    -- Create Conferences
    CREATE TABLE IF NOT EXISTS CFB_CONFERENCES (
        CONFERENCE_ID       BIT             NOT NULL,
        DIVISION_ID         BIT             NOT NULL,
        CONFERENCE_NAME     VARCHAR(32)     NULL,
        DIVISION_NAME       VARCHAR(8)      NULL,

        PRIMARY KEY (DIVISION_ID)
    );

    -- Create Schools
    CREATE TABLE IF NOT EXISTS CFB_SCHOOLS (
        SCHOOL_ID           SMALLINT        UNSIGNED    NOT NULL,
        LOGO_URL            VARCHAR(128)    NULL,
        SCHOOL_NAME         VARCHAR(32)     NULL,
        MASCOT              VARCHAR(32)     NULL,
        RECORD              VARCHAR(8)      NULL,
        WINS                BIT             NULL,
        LOSSES              BIT             NULL,
        TIES                BIT             NULL,
        DIVISION            BIT             NOT NULL,

        PRIMARY KEY (SCHOOL_ID),
        FOREIGN KEY (DIVISION) REFERENCES CFB_CONFERENCES(DIVISION_ID)
    );

    -- Create CFB_GAMES
    CREATE TABLE IF NOT EXISTS CFB_GAMES (
        GAME_WEEK           BIT            NOT NULL,
        GAME_DATE           VARCHAR(32)    NULL,
        AWAY_SCHOOL         SMALLINT       UNSIGNED    NOT NULL,
        HOME_SCHOOL         SMALLINT       UNSIGNED    NOT NULL,
        GAME_ID             INT            UNSIGNED    NOT NULL,
        GAME_TIME           VARCHAR(16)    NULL,
        SCORE               VARCHAR(8)     NULL,
        GAME_LOCATION       TINYINT        UNSIGNED    NOT NULL,

        PRIMARY KEY (GAME_ID),
        FOREIGN KEY (GAME_LOCATION) REFERENCES CFB_LOCATIONS(LOCATION_ID),
        FOREIGN KEY (AWAY_SCHOOL) REFERENCES CFB_SCHOOLS(SCHOOL_ID),
        FOREIGN KEY (HOME_SCHOOL) REFERENCES CFB_SCHOOLS(SCHOOL_ID)
    );

    -- Users
    CREATE TABLE IF NOT EXISTS CFB_USERS (
        USER_ID             INT             UNSIGNED    NOT NULL    AUTO_INCREMENT,
        USERNAME            VARCHAR(32)     NOT NULL,
        PW                  VARCHAR(32)     NULL,

        PRIMARY KEY (USER_ID)            
    );

    -- User Picks
    CREATE TABLE IF NOT EXISTS CFB_USER_PICKS (
        USER_ID             INT             UNSIGNED    NOT NULL,
        GAME_ID             INT             UNSIGNED    NOT NULL,
        SELECTED_SCHOOL     SMALLINT        UNSIGNED    NOT NULL,

        PRIMARY KEY (USER_ID, GAME_ID),
        FOREIGN KEY (USER_ID) REFERENCES CFB_USERS(USER_ID),
        FOREIGN KEY (GAME_ID) REFERENCES CFB_GAMES(GAME_ID)
    );

END //

delimiter ;
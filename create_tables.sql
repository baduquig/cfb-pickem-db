CREATE PROCEDURE CREATE_CFB_PICKEM_TABLES()

BEGIN

    -- Create CFB_GAMES
    CREATE TABLE CFB_GAMES (
        GAME_WEEK           BIT            NOT NULL,
        GAME_DATE           VARCHAR(32)    NULL,
        AWAY_SCHOOL         SMALLINT       UNSIGNED    NOT NULL,
        HOME_SCHOOL         SMALLINT       UNSIGNED    NOT NULL,
        GAME_ID             INT            UNSIGNED    NOT NULL,
        GAME_TIME           VARCHAR(16)    NULL,
        SCORE               VARCHAR(8)     NULL,
        GAME_LOCATION       VARCHAR(64)    NOT NULL
    );

    -- Create Schools
    CREATE TABLE CFB_SCHOOLS (
        SCHOOL_ID           SMALLINT        UNSIGNED    NOT NULL,
        LOGO_URL            VARCHAR(128)    NULL,
        SCHOOL_NAME         VARCHAR(32)     NULL,
        MASCOT              VARCHAR(32)     NULL,
        RECORD              VARCHAR(8)      NULL,
        WINS                BIT             NULL,
        LOSSES              BIT             NULL,
        TIES                BIT             NULL,
        DIVISION            BIT             NOT NULL
    );

    -- Create Conferences
    CREATE TABLE CFB_CONFERENCES (
        CONFERENCE_ID       BIT             NOT NULL,
        DIVISION_ID         BIT             NOT NULL,
        CONFERENCE_NAME     VARCHAR(32)     NULL,
        DIVISION_NAME       VARCHAR(8)      NULL
    );

    -- Create Locations
    CREATE TABLE CFB_LOCATIONS (
        LOCATION_ID         TINYINT         UNSIGNED    NOT NULL,
        LOCATION_NAME       VARCHAR(64)     NULL,
        CITY                VARCHAR(32)     NULL,
        STATE_NAME          CHAR(2)         NULL,
        LATITUDE            FLOAT(10, 7)    NULL,
        LONGITUDE           FLOAT(10, 7)    NULL
    );

    -- Users
    CREATE TABLE CFB_USERS (
        USER_ID             INT             UNSIGNED    NOT NULL    AUTO_INCREMENT,
        USERNAME            VARCHAR(32)     NOT NULL,
        PW                  VARCHAR(32)     NULL            
    );

    -- User Picks
    CREATE TABLE CFB_USER_PICKS (
        USER_ID             INT             UNSIGNED    NOT NULL,
        GAME_ID             INT             UNSIGNED    NOT NULL,
        SELECTED_SCHOOL     SMALLINT        UNSIGNED    NOT NULL
    );

END;
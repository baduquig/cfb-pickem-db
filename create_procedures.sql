/************************************************
 Foundational Procedures for CFB Pickem Database
 1) create_tables
 2) create_constraints
 3) delete_data
 4) drop_constraints
 5) drop_tables
************************************************/

delimiter //

/***********************************************/
-- create_tables
CREATE PROCEDURE CREATE_CFB_PICKEM_TABLES()

BEGIN

    -- Create CFB_GAMES
    CREATE TABLE CFB_GAMES (
        GAME_WEEK           BIT             NOT NULL,
        GAME_DATE           VARCHAR(32)     NULL,
        AWAY_SCHOOL         SMALLINT        UNSIGNED    NOT NULL,
        HOME_SCHOOL         SMALLINT        UNSIGNED    NOT NULL,
        GAME_ID             INT             UNSIGNED    NOT NULL,
        GAME_TIME           VARCHAR(16)     NULL,
        SCORE               VARCHAR(8)      NULL,
        GAME_LOCATION       VARCHAR(64)     NOT NULL
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
        PW                  VARCHAR(32)     NULL,
        PRIMARY KEY (USER_ID)
    );

    -- User Picks
    CREATE TABLE CFB_USER_PICKS (
        USER_ID             INT             UNSIGNED    NOT NULL,
        GAME_ID             INT             UNSIGNED    NOT NULL,
        SELECTED_SCHOOL     SMALLINT        UNSIGNED    NOT NULL
    );

END //
/***********************************************/


/***********************************************/
-- create_constraints
CREATE PROCEDURE CREATE_CFB_PICKEM_CONSTRAINTS()

BEGIN

    -- Primary Keys
    ALTER TABLE CFB_GAMES
    ADD CONSTRAINT PK_GAMES PRIMARY KEY (GAME_ID);

    ALTER TABLE CFB_SCHOOLS
    ADD CONSTRAINT PK_SCHOOLS PRIMARY KEY (SCHOOL_ID);

    ALTER TABLE CFB_CONFERENCES
    ADD CONSTRAINT PK_CONFERENCES PRIMARY KEY (DIVISION_ID);

    ALTER TABLE CFB_LOCATIONS
    ADD CONSTRAINT PK_LOCATIONS PRIMARY KEY (LOCATION_ID);

    ALTER TABLE CFB_USER_PICKS
    ADD CONSTRAINT PK_PICKS PRIMARY KEY (USER_ID, GAME_ID);


    -- Foreign Keys
    ALTER TABLE CFB_GAMES
    ADD CONSTRAINT FK_GAME_AWAY_SCHOOL
    FOREIGN KEY (AWAY_SCHOOL) REFERENCES CFB_SCHOOLS(SCHOOL_ID);

    ALTER TABLE CFB_GAMES
    ADD CONSTRAINT FK_GAME_HOME_SCHOOL
    FOREIGN KEY (HOME_SCHOOL) REFERENCES CFB_SCHOOLS(SCHOOL_ID);

    ALTER TABLE CFB_GAMES
    ADD CONSTRAINT FK_GAME_LOCATION
    FOREIGN KEY (GAME_LOCATION) REFERENCES CFB_LOCATIONS(LOCATION_ID);

    ALTER TABLE CFB_SCHOOLS
    ADD CONSTRAINT FK_SCHOOL_DIVISION
    FOREIGN KEY (DIVISION) REFERENCES CFB_CONFERENCES(DIVISION_ID);

    ALTER TABLE CFB_USER_PICKS
    ADD CONSTRAINT FK_PICK_USER_ID
    FOREIGN KEY (USER_ID) REFERENCES CFB_USERS(USER_ID);

    ALTER TABLE CFB_USER_PICKS
    ADD CONSTRAINT FK_PICK_GAME_ID
    FOREIGN KEY (GAME_ID) REFERENCES CFB_GAMES(GAME_ID);

END //
/***********************************************/


/***********************************************/
-- delete_data
CREATE PROCEDURE DELETE_CFB_PICKEM_DATA()

BEGIN

    DELETE FROM CFB_USER_PICKS;

    DELETE FROM CFB_USERS;

    DELETE FROM CFB_LOCATIONS;

    DELETE FROM CFB_CONFERENCES;

    DELETE FROM CFB_SCHOOLS;
 
    DELETE FROM CFB_GAMES;

END //
/***********************************************/


/***********************************************/
-- drop_constraints
CREATE PROCEDURE DROP_CFB_PICKEM_CONSTRAINTS()

BEGIN

    -- Foreign Keys
    ALTER TABLE CFB_USER_PICKS
    DROP FOREIGN KEY FK_PICK_USER_ID;

    ALTER TABLE CFB_USER_PICKS
    DROP FOREIGN KEY FK_PICK_GAME_ID;

    ALTER TABLE CFB_SCHOOLS
    DROP FOREIGN KEY FK_SCHOOL_DIVISION;

    ALTER TABLE CFB_GAMES
    DROP FOREIGN KEY FK_GAME_LOCATION;

    ALTER TABLE CFB_GAMES
    DROP FOREIGN KEY FK_GAME_HOME_SCHOOL;

    ALTER TABLE CFB_GAMES
    DROP FOREIGN KEY FK_GAME_AWAY_SCHOOL;


    -- Primary Keys
    ALTER TABLE CFB_USER_PICKS
    DROP PRIMARY KEY;

    ALTER TABLE CFB_USERS
    DROP PRIMARY KEY;

    ALTER TABLE CFB_LOCATIONS
    DROP PRIMARY KEY;

    ALTER TABLE CFB_CONFERENCES
    DROP PRIMARY KEY;

    ALTER TABLE CFB_SCHOOLS
    DROP PRIMARY KEY;

    ALTER TABLE CFB_GAMES
    DROP PRIMARY KEY;

END //
/***********************************************/


/***********************************************/
-- drop_tables
CREATE PROCEDURE DROP_CFB_PICKEM_TABLES()

BEGIN

    DROP TABLE CFB_USER_PICKS;

    DROP TABLE CFB_USERS;

    DROP TABLE CFB_LOCATIONS;

    DROP TABLE CFB_CONFERENCES;

    DROP TABLE CFB_SCHOOLS;

    DROP TABLE CFB_GAMES;

END //
/***********************************************/


delimiter ;


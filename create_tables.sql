-- Create CFB_GAMES
CREATE CFB_GAMES (
    GAME_WEEK           BIT             NOT NULL,
    GAME_DATE           VARCHAR2(32)    NULL,
    AWAY_SCHOOL         SMALLINT        UNSIGNED    NOT NULL,
    HOME_SCHOOL         SMALLINT        UNSIGNED    NOT NULL,
    GAME_ID             INT,            UNSIGNED    NOT NULL,
    GAME_TIME           VARCHAR2(16)    NULL,
    SCORE               VARCHAR2(8)     NULL,
    GAME_LOCATION       VARCHAR2(64)    NOT NULL
);

-- Create Schools
CREATE CFB_SCHOOLS (
    SCHOOL_ID           SMALLINT        UNSIGNED    NOT NULL,
    LOGO_URL            VARCHAR2(128)   NULL,
    SCHOOL_NAME         VARCHAR2(32)    NULL,
    MASCOT              VARCHAR2(32)    NULL,
    RECORD              VARCHAR2(8)     NULL,
    WINS                BIT             NULL,
    LOSSES              BIT             NULL,
    TIES                BIT             NULL,
    DIVISION            BIT             NOT NULL
);

-- Create Conferences
CREATE CFB_CONFERENCES (
    CONFERENCE_ID       BIT             NOT NULL,
    DIVISION_ID         BIT             NOT NULL,
    CONFERENCE_NAME     VARCHAR2(32)    NULL,
    DIVISION_NAME       VARCHAR2(8)     NULL
);

-- Create Locations
CREATE CFB_LOCATIONS (
    LOCATION_ID         TINYINT         UNSIGNED    NOT NULL,
    LOCATION_NAME       VARCHAR2(64)    NULL,
    CITY                VARCHAR2(32)    NULL,
    STATE_NAME          CHAR(2)         NULL,
    LATITUDE            FLOAT(10, 7)    NULL,
    LONGITUDE           FLOAT(10, 7)    NULL
);
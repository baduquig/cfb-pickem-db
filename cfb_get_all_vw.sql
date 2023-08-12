CREATE VIEW CFB_GET_ALL_VW AS

SELECT 
    P.USER_ID AS userID,
    U.USERNAME AS userName,
    P.GAME_ID AS gameID,
    P.SELECTED_SCHOOL AS selectedSchool,
    G.GAME_WEEK AS gameWeek,
    G.GAME_DATE AS gameDate,
    G.GAME_TIME AS gameTime,
    G.AWAY_SCORE AS awayScore,
    G.AWAY_SCHOOL AS awaySchoolID,
    AWAY.SCHOOL_NAME AS awaySchoolName,
    AWAY.MASCOT AS awaySchoolMascot,
    AWAY.WINS AS awaySchoolWins,
    AWAY.LOSSES AS awaySchoolLosses,
    AWAY.TIES AS awaySchoolTies,
    AC.DIVISION_NAME AS awaySchoolDivisionName,
    AC.CONFERENCE_NAME AS awaySchoolConferenceName,
    G.HOME_SCORE AS homeScore,
    G.HOME_SCHOOL AS homeSchoolID,
    HOME.SCHOOL_NAME AS homeSchoolName,
    HOME.MASCOT AS homeSchoolMascot,
    HOME.WINS AS homeSchoolWins,
    HOME.LOSSES AS homeSchoolLosses,
    HOME.TIES AS homeSchoolTies,
    HC.DIVISION_NAME AS homeSchoolDivisionName,
    HC.CONFERENCE_NAME AS homeSchoolConferenceName,
    L.LOCATION_NAME AS locationName,
    L.CITY AS locationCity,
    L.STATE_NAME AS locationState,

    CASE
        WHEN (P.SELECTED_SCHOOL = G.AWAY_SCHOOL AND G.AWAY_SCORE > G.HOME_SCORE) THEN 2
        WHEN (P.SELECTED_SCHOOL = G.HOME_SCHOOL AND G.AWAY_SCORE < G.HOME_SCORE) THEN 2
        WHEN (P.SELECTED_SCHOOL IS NOT NULL AND G.AWAY_SCORE = G.HOME_SCORE) THEN 1
        ELSE 0
    END AS selectionPoints
FROM
    CFB_USER_PICKS P
        LEFT JOIN CFB_USERS U
            ON P.USER_ID = U.USER_ID
        LEFT JOIN CFB_GAMES G
            ON P.GAME_ID = G.GAME_ID
        LEFT JOIN CFB_LOCATIONS L
            ON G.GAME_LOCATION = LOCATION_ID
        LEFT JOIN CFB_SCHOOLS AWAY
            ON G.AWAY_SCHOOL = AWAY.SCHOOL_ID
        LEFT JOIN CFB_SCHOOLS HOME
            ON G.HOME_SCHOOL = HOME.SCHOOL_ID
        LEFT JOIN CFB_CONFERENCES AC
            ON AWAY.DIVISION = AC.DIVISION_ID
        LEFT JOIN CFB_CONFERENCES HC
            ON HOME.DIVISION = HC.DIVISION_ID;
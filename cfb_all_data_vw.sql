CREATE PROCEDURE CFB_ALL_DATA_VW()

BEGIN

    SELECT 
        P.*
    FROM
        CFB_USER_PICKS P
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
                ON HOME.DIVISION = HC.DIVISION_ID

END;
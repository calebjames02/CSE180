CREATE OR REPLACE FUNCTION
promoteCrewMembersFunction(crewAssignments INTEGER, minYearsExperience INTEGER)
RETURNS INTEGER AS $$

    DECLARE
        numPromoted INTEGER := 0;

    BEGIN

	-- Input Validation
	IF crewAssignments < 0 OR minYearsExperience < 0 OR (crewAssignments = 0 AND minYearsExperience = 0) THEN
	    RETURN -1;		/* Illegal value for promotion */
	    END IF;

    UPDATE CrewMember c
    SET crewRole = 'Senior ' || crewRole
    WHERE crewRole NOT LIKE 'Senior%' AND (SELECT COUNT(*) FROM FlightCrewAssignment f WHERE f.crewID = c.crewID) >= crewAssignments AND yearsExperience >= minYearsExperience;
            
    GET DIAGNOSTICS numPromoted = ROW_COUNT;

	RETURN numPromoted;

    END

$$ LANGUAGE plpgsql;

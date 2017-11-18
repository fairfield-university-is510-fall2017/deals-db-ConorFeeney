/*
Name: Conor Feeney
Date: 18/11/17
Purpose: Adding foreign keys to the tables
*/

USE deals;  

#Adding Foreign key TypeCode to DEALTYPES
ALTER TABLE `DEALTYPES`  
  ADD FOREIGN KEY (`TypeCode`)
    REFERENCES `TYPECODES` (`TypeCode`);
    
#Adding Foreign key DealID to DEALTYPES
ALTER TABLE `DEALTYPES`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `DEALS` (`DealID`);

#Adding Foreign key DealID to DEALPARTS
ALTER TABLE `DEALPARTS`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `DEALS` (`DealID`);

#Adding Foreign key DealID to PLAYERS
ALTER TABLE `PLAYERS`  
  ADD FOREIGN KEY (`DealID`)
    REFERENCES `DEALS` (`DealID`);
 
#Adding Foreign key CompanyID to PLAYERS 
ALTER TABLE `PLAYERS`  
  ADD FOREIGN KEY (`CompanyID`)
    REFERENCES `COMPANIES` (`CompanyID`);
    
#Adding Foreign key RoleCode to PLAYERS
ALTER TABLE `PLAYERS`  
  ADD FOREIGN KEY (`RoleCode`)
    REFERENCES `ROLECODES` (`RoleCode`);
    
#Adding Foreign key PlayerID to PLAYERSUPPORTS
ALTER TABLE `PLAYERSUPPORTS`  
  ADD FOREIGN KEY (`PlayerID`)
    REFERENCES `PLAYERS` (`PlayerID`);
    
#Adding Foreign key FirmID to PLAYERSUPPORTS
ALTER TABLE `PLAYERSUPPORTS`  
  ADD FOREIGN KEY (`FirmID`)
    REFERENCES `FIRMS` (`FirmID`);
 
#Adding Foreign key SupportCodeID to PLAYERSUPPORTS 
ALTER TABLE `PLAYERSUPPORTS`  
  ADD FOREIGN KEY (`SupportCodeID`)
    REFERENCES `SUPPORTCODES` (`SupportCodeID`);
/*    
ALTER TABLE `players`
	DROP FOREIGN KEY `players_ibfk_2`;
    

ALTER TABLE `players`
	DROP FOREIGN KEY `players_ibfk_1`;
*/
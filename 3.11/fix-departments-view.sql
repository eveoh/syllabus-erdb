IF OBJECT_ID ('sdintegrator.SDVC_DEPARTMENT','view') IS NOT NULL
    DROP VIEW sdintegrator.SDVC_DEPARTMENT;
GO

CREATE VIEW sdintegrator.SDVC_DEPARTMENT
 AS
 
 SELECT       
                    
        sdowner.SDO_DEPARTMENT.Id                 
             ,sdowner.SDO_DEPARTMENT.NAME                
            ,sdowner.SDO_DEPARTMENT.HOST_KEY                
            ,sdowner.SDO_DEPARTMENT.DESCRIPTION                
            ,sdowner.SDP_DEPARTMENT.DEPARTMENT                
            ,sdowner.SDP_DEPARTMENT.ZONE                
            ,sdowner.SDP_OBJ_WITH_DICT.DICT                
            ,sdowner.SDP_USER_TEXT.USER_TEXT_1                
            ,sdowner.SDP_USER_TEXT.USER_TEXT_2                
            ,sdowner.SDP_USER_TEXT.USER_TEXT_3                
            ,sdowner.SDP_USER_TEXT.USER_TEXT_4                
            ,sdowner.SDP_USER_TEXT.USER_TEXT_5
            ,sdowner.SDO_DEPARTMENT.ObsoleteFrom                
            ,SDINTEGRATOR.MaximumValue (sdowner.SDO_DEPARTMENT.LastChanged,
                                       sdowner.SDP_DEPARTMENT.LastChanged,
                                       sdowner.SDP_OBJ_WITH_DICT.LastChanged,
                                       sdowner.SDP_USER_TEXT.LastChanged,
                                       0,0,0,0) LatestTransaction
        
FROM

         sdowner.SDO_DEPARTMENT            
                        
             LEFT JOIN sdowner.SDP_DEPARTMENT            
        
                ON sdowner.SDO_DEPARTMENT.Id = sdowner.SDP_DEPARTMENT.Id                
             LEFT JOIN sdowner.SDP_OBJ_WITH_DICT            
        
                ON sdowner.SDO_DEPARTMENT.Id = sdowner.SDP_OBJ_WITH_DICT.Id                
             LEFT JOIN sdowner.SDP_USER_TEXT            
        
                ON sdowner.SDO_DEPARTMENT.Id = sdowner.SDP_USER_TEXT.Id     
WHERE
            (sdowner.SDO_DEPARTMENT.LastChanged = (SELECT MAX(LastChanged)
                                                                                                                                     FROM sdowner.SDO_DEPARTMENT AS t1
                                                                                                                                     WHERE t1.Id = sdowner.SDO_DEPARTMENT.Id))
                    
             AND
            (sdowner.SDP_DEPARTMENT.LastChanged = (SELECT MAX(LastChanged)
                                                                                                                                     FROM sdowner.SDP_DEPARTMENT AS t1
                                                                                                                                     WHERE t1.Id = sdowner.SDP_DEPARTMENT.Id))
                    
             AND
            (sdowner.SDP_OBJ_WITH_DICT.LastChanged = (SELECT MAX(LastChanged)
                                                                                                                                     FROM sdowner.SDP_OBJ_WITH_DICT AS t1
                                                                                                                                     WHERE t1.Id = sdowner.SDP_OBJ_WITH_DICT.Id))
                    
             AND
            (sdowner.SDP_USER_TEXT.LastChanged = (SELECT MAX(LastChanged)
                                                                                                                                     FROM sdowner.SDP_USER_TEXT AS t1
                                                                                                                                     WHERE t1.Id = sdowner.SDP_USER_TEXT.Id))
    
        
GO        
    
-- Creates V_Examination_Location which is not in the current ES database
-- Used to read the locations of exams, even if they are not in a session

CREATE VIEW [rdreader].[V_Examination_Location] AS
  SELECT
    rca.ActivityId as ExaminationId,
    rca.ResourceConfigurationId as LocationId,
    rca.CapacityUsed as AllocatedSeats
  FROM
    dbo.G2R_ResourceConfigurationAllocation as rca

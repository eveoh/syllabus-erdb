SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [rdowner].[Act_GParents](
	[ActivityID] [char](32) NOT NULL,
	[ParentID] [char](32) NOT NULL,
 CONSTRAINT [PK_Act_GParents] PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC,
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [rdowner].[V_ACT_GPARENTS]
AS
SELECT  p1.ActivityId ActivityId, isnull(p2.ParentId, p1.ParentId) ParentId
FROM         rdowner.V_ACT_PARENTS p1
LEFT JOIN rdowner.V_ACT_PARENTS p2 ON p2.ActivityId = p1.ParentId
GO

-- Act_GParents lookup on Parent
create nonclustered index [act_Gparents_parent] on [rdowner].[Act_GParents] ([ParentId]) include ([ActivityId])

CREATE SCHEMA rdreader;
GO
/****** Object:  Table [rdreader].[V_AcademicPeriod]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_AcademicPeriod](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Hostkey] [nvarchar](1024) NULL,
	[FinishDate] [smalldatetime] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[StartTime] [smalldatetime] NOT NULL,
	[FinishTime] [smalldatetime] NOT NULL,
	[CalendarId] [char](32) NOT NULL,
	[IsTeachingPeriod] [int] NOT NULL,
	[IsExaminationPeriod] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Department]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Department](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentDepartmentId] [char](32) NULL,
	[ExtraDataId] [char](32) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_ExamAllocation]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_ExamAllocation](
	[Id] [char](32) NOT NULL,
	[StudentId] [char](32) NOT NULL,
	[ExamRequirementId] [char](32) NOT NULL,
	[CandidateNumber] [nvarchar](1024) NULL,
	[NeedsExtraProvision] [bit] NULL,
	[ExaminationId] [char](32) NULL,
	[LocationId] [char](32) NULL,
	[ExamRoomLocationId] [char](32) NULL,
	[PrepRoomLocationId] [char](32) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Examination]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Examination](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[Description] [nvarchar](255) NULL,
	[Duration] [int] NOT NULL,
	[StartDateTime] [smalldatetime] NULL,
	[IsScheduled] [int] NOT NULL,
	[PlannedSize] [int] NOT NULL,
	[BatchSize] [int] NULL,
	[NumberOfBatches] [int] NOT NULL,
	[IsSameTime] [bit] NOT NULL,
	[ExamType] [int] NOT NULL,
	[ExaminationType] [varchar](8) NOT NULL,
	[IsParallelExam] [int] NOT NULL,
	[IsSerialExam] [int] NOT NULL,
	[IsDefaultExam] [int] NOT NULL,
	[LocationsRequired] [bit] NOT NULL,
	[RequiresLocation] [bit] NOT NULL,
	[PermittedMaterials] [nvarchar](max) NULL,
	[WritingTime] [int] NOT NULL,
	[ExtraWritingTime] [int] NOT NULL,
	[IsFixedExtraWritingTime] [bit] NOT NULL,
	[ReadingTime] [int] NOT NULL,
	[ExtraReadingTime] [int] NOT NULL,
	[IsFixedExtraReadingTime] [bit] NOT NULL,
	[MaximumDuration] [int] NOT NULL,
	[SchedulingNotes] [nvarchar](max) NULL,
	[IgnorePreparationRoomProximity] [bit] NULL,
	[RequiresPreparationRoom] [bit] NULL,
	[RequiresPreparationRoomPerStudent] [bit] NULL,
	[RequiresExclusiveExamRoom] [bit] NOT NULL,
	[RequiresExclusivePreparationRoom] [bit] NULL,
	[WhoScheduledUserId] [char](32) NULL,
	[WhenScheduledUserId] [smalldatetime] NULL,
	[DepartmentId] [char](32) NULL,
	[PresetLocationId] [char](32) NULL,
	[PresetZoneId] [char](32) NULL,
	[ExamRequirementId] [char](32) NOT NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Examination_Location]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Examination_Location](
	[ExaminationId] [char](32) NOT NULL,
	[LocationId] [char](32) NOT NULL,
	[AllocatedSeats] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_ExamRequirement]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_ExamRequirement](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[DepartmentId] [char](32) NOT NULL,
	[AcademicPeriodId] [char](32) NOT NULL,
	[ExaminationPeriodId] [char](32) NOT NULL,
	[PresetLocationId] [char](32) NULL,
	[PresetZoneId] [char](32) NULL,
	[CalendarId] [char](32) NOT NULL,
	[ExamType] [int] NOT NULL,
	[ExaminationType] [varchar](8) NOT NULL,
	[IsParallelExam] [int] NOT NULL,
	[IsSerialExam] [int] NOT NULL,
	[WritingTime] [int] NOT NULL,
	[ReadingTime] [int] NOT NULL,
	[PlannedSize] [int] NOT NULL,
	[ModuleOfferingId] [char](32) NULL,
	[MinimumSplitSize] [int] NULL,
	[IsPublished] [bit] NOT NULL,
	[RequiresLocation] [bit] NOT NULL,
	[PaperStatus] [int] NOT NULL,
	[PermittedMaterials] [nvarchar](max) NULL,
	[EarliestStart] [smalldatetime] NULL,
	[LatestEnd] [smalldatetime] NULL,
	[FixedDate] [smalldatetime] NULL,
	[FixedTime] [smalldatetime] NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL,
	[BatchSize] [int] NULL,
	[SchedulingNotes] [nvarchar](max) NULL,
	[MaximumDuration] [int] NOT NULL,
	[RequiresPrepRoom] [bit] NULL,
	[RequiresExclusiveUseOfPrepRoom] [bit] NULL,
	[RequiresIndividualPrepRoomPerStudent] [bit] NULL,
	[RequiresExclusiveUseOfExamRoom] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_ExamSession]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_ExamSession](
	[Id] [char](32) NOT NULL,
	[NAME] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Hostkey] [nvarchar](1024) NULL,
	[SessionStart] [smalldatetime] NOT NULL,
	[SessionDuration] [int] NOT NULL,
	[RequiredNumberOfInvigilators] [int] NOT NULL,
	[NeedsReview] [bit] NOT NULL,
	[LocationId] [char](32) NOT NULL,
	[AcademicPeriodId] [char](32) NOT NULL,
	[ExaminationPeriodId] [char](32) NOT NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_ExamSession_Examination]    Script Date: 15/02/2018 16:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_ExamSession_Examination](
	[ExamSessionId] [char](32) NOT NULL,
	[ExamActivityId] [char](32) NOT NULL,
	[ExaminationId] [char](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Invigilator]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Invigilator](
	[Name] [nvarchar](255) NULL,
	[Id] [char](32) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[EngagementDate] [smalldatetime] NULL,
	[TerminationDate] [smalldatetime] NULL,
	[ValidFromDate] [smalldatetime] NULL,
	[ValidToDate] [smalldatetime] NULL,
	[Type] [nvarchar](255) NULL,
	[DeptOrSchool] [char](32) NULL,
	[DepartmentId] [char](32) NULL,
	[MinConsecutiveTimePerDay] [int] NULL,
	[MaxConsecutiveTimePerDay] [int] NULL,
	[MaxWeeklyHours] [int] NULL,
	[UsagePreferenceNumber] [int] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Email] [varchar](255) NULL,
	[Birthday] [smalldatetime] NULL,
	[Address] [nvarchar](1024) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[CalendarId] [char](32) NOT NULL,
	[IsStaffMember] [int] NOT NULL,
	[LinkedStaffId] [char](32) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Invigilator_ExamSession]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Invigilator_ExamSession](
	[ExamSessionId] [char](32) NOT NULL,
	[InvigilatorId] [char](32) NOT NULL,
	[IsFloating] [bit] NOT NULL,
	[RoleId] [char](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Location]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Location](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[AvailableFromDate] [smalldatetime] NULL,
	[AvailableToDate] [smalldatetime] NULL,
	[ValidFrom] [smalldatetime] NULL,
	[ValidTo] [smalldatetime] NULL,
	[OwningLocationHostKey] [nvarchar](1024) NULL,
	[OwningLocationName] [nvarchar](255) NULL,
	[OwningLocationDescription] [nvarchar](255) NULL,
	[DepartmentId] [char](32) NULL,
	[LocationType] [nvarchar](255) NULL,
	[DefaultCapacity] [int] NOT NULL,
	[ZoneId] [char](32) NULL,
	[IsPartitionRoom] [bit] NOT NULL,
	[CalendarId] [char](32) NOT NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_ModuleOffering]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_ModuleOffering](
	[TeachingPeriodId] [char](32) NOT NULL,
	[Id] [char](32) NOT NULL,
	[ModuleName] [nvarchar](255) NULL,
	[ModuleHostkey] [nvarchar](1024) NULL,
	[ModuleDescription] [nvarchar](255) NULL,
	[DepartmentIdModule] [char](32) NULL,
	[Name] [nvarchar](255) NULL,
	[Hostkey] [nvarchar](1024) NULL,
	[Description] [nvarchar](255) NULL,
	[DepartmentId] [char](32) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Staff]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Staff](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[EngagementDate] [smalldatetime] NULL,
	[TerminationDate] [smalldatetime] NULL,
	[ValidFrom] [smalldatetime] NULL,
	[ValidTo] [smalldatetime] NULL,
	[DepartmentId] [char](32) NULL,
	[Type] [nvarchar](255) NULL,
	[CalendarId] [char](32) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Email] [varchar](255) NULL,
	[IsInvigilator] [int] NOT NULL,
	[LinkedInvigilatorId] [char](32) NULL,
	[Birthday] [smalldatetime] NULL,
	[Address] [nvarchar](1024) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Staff_ExamRequirement]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Staff_ExamRequirement](
	[StaffId] [char](32) NOT NULL,
	[ExamRequirementId] [char](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Student]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Student](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[EnrolementDate] [smalldatetime] NULL,
	[GraduationDate] [smalldatetime] NULL,
	[ValidFromDate] [smalldatetime] NULL,
	[ValidToDate] [smalldatetime] NULL,
	[DepartmentId] [char](32) NULL,
	[Type] [nvarchar](255) NULL,
	[NeedsExtraProvision] [bit] NULL,
	[ExtraReadingMinutes] [int] NOT NULL,
	[ExtraWritingMinutes] [int] NOT NULL,
	[AdditionalRequirements] [nvarchar](max) NULL,
	[IsFixedExtraWritingTime] [bit] NOT NULL,
	[IsFixedExtraReadingTime] [bit] NOT NULL,
	[CalendarId] [char](32) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Email] [varchar](255) NULL,
	[Birthday] [smalldatetime] NULL,
	[Address] [nvarchar](1024) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](50) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [rdreader].[V_Zone]    Script Date: 15/02/2018 16:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_Zone](
	[Id] [char](32) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[HostKey] [nvarchar](1024) NULL,
	[ParentZoneId] [char](32) NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Text10] [nvarchar](max) NULL,
	[Numeric1] [int] NULL,
	[Numeric2] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rdreader].[V_SerialExamAllocation] (
	[ExaminationId] [char](32) NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[SlotNumber] [int] NOT NULL,
	[ExamAllocationId] [char](32) NULL,
	[BatchPrepStartTime] [datetime] NULL,
	[BatchExamStartTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

CREATE NONCLUSTERED INDEX [examination_examrequirement] ON [rdreader].[V_Examination]
(
	[ExamRequirementId] ASC
)
INCLUDE ([Id])

CREATE NONCLUSTERED INDEX [examrequirement_id] ON [rdreader].[V_ExamRequirement]
(
	[Id] ASC
)
INCLUDE ([Name],
	[Description],
	[HostKey],
	[Text1],
	[Text2],
	[Text3],
	[Text4],
	[Text5],
	[Text6],
	[Text7],
	[Text8],
	[Text9],
	[Text10],
	[Numeric1],
	[Numeric2])

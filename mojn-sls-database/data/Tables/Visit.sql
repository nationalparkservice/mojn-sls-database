CREATE TABLE [data].[Visit] (
    [ID]          UNIQUEIDENTIFIER        NOT NULL,
	[Park]		  VARCHAR (4)    NOT NULL,
    [SpringCode]      VARCHAR (11)   NOT NULL,
    [VisitDate]   DATETIME2 (0)  NOT NULL,
    [StartTime]   DATETIME2 (0)  NULL,
	[BMICollected]	  VARCHAR (1) NOT NULL,
	[ChemCollected]	  VARCHAR (1) NOT NULL,
	[WQCollected]	  VARCHAR (50) NOT NULL,
	[WQNotCollectedReason]	  VARCHAR (30),
	[VolDischargeCollected]	  VARCHAR (1) NOT NULL,
	[EstDischargeCollected]	  VARCHAR (1) NOT NULL,
	[PTDataCollected]	  VARCHAR (1) NOT NULL,
	[GageDataCollected]	  VARCHAR (1) NOT NULL,
    [Notes]       VARCHAR (2000) NULL,
    [ProtocolID]  TINYINT        NOT NULL,
    [DateCreated] DATETIME2 (0)  CONSTRAINT [DF_Visit_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Visit_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Visit_VisitDate_range] CHECK ([VisitDate]<=getdate() AND [VisitDate]>=CONVERT([date],'01/01/2012',(101))),
    CONSTRAINT [FK_Visit_Protocol] FOREIGN KEY ([ProtocolID]) REFERENCES [ref].[Protocol] ([ID]),
    CONSTRAINT [FK_Visit_Site] FOREIGN KEY ([SpringCode]) REFERENCES [data].[Site] ([Code])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Visit_SiteID_VisitDate_VisitTime]
    ON [data].[Visit]([SpringCode] ASC, [VisitDate] ASC, [StartTime] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about individual sampling visits', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Park code and foreign key to lookup.Park', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'Park';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Spring code and foreign key to data.Site (the springs in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SpringCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date monitoring visit occurred', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VisitDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time monitoring visit began', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether BMI data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'BMICollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether water chemistry data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ChemCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'List of water quality data collected at this visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'WQCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'If any water quality data were not collected, the reason why. Foreign key to lookup.WQNotCollectedReason.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'WQNotCollectedReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether volumetric discharge data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VolDischargeCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether estimated discharge data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'EstDischargeCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether pressure transducer data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'PTDataCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether gage data were collected at this visit. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'GageDataCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes regarding the site visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Protocol (version of protocol used at this visit)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ProtocolID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DateCreated';


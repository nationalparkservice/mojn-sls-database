CREATE TABLE [data].[WellActivity] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT            NOT NULL,
    [TapeID]                  TINYINT        NOT NULL,
    [WellSiteStatusID]        TINYINT        NOT NULL,
    [MeasurementMethodID]     TINYINT        NOT NULL,
    [WaterLevelTypeID]        TINYINT        NOT NULL,
    [Notes]                   VARCHAR (2000) NULL,
    [DataProcessingLevelDate] DATETIME2 (0)  CONSTRAINT [DF_WellActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelID]   TINYINT        CONSTRAINT [DF_WellActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500)  NULL,
    [DateCreated]             DATETIME2 (0)  CONSTRAINT [DF_WellVisit_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WellVisit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WellActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_WellActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_WellActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_WellVisit_MeasurementMethod] FOREIGN KEY ([MeasurementMethodID]) REFERENCES [lookup].[MeasurementMethod] ([ID]),
    CONSTRAINT [FK_WellVisit_Tape] FOREIGN KEY ([TapeID]) REFERENCES [ref].[Tape] ([ID]),
    CONSTRAINT [FK_WellVisit_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
    CONSTRAINT [FK_WellVisit_WaterLevelType] FOREIGN KEY ([WaterLevelTypeID]) REFERENCES [lookup].[WaterLevelType] ([ID]),
    CONSTRAINT [FK_WellVisit_WellSiteStatus] FOREIGN KEY ([WellSiteStatusID]) REFERENCES [lookup].[WellSiteStatus] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_WellVisit_VisitID]
    ON [data].[WellActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about well visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Tape (tape used to measure well depth)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'TapeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.WellSiteStatus (flow status of well)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'WellSiteStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.MeasurementMethod (USGS well measurement method)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'MeasurementMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.WaterLevelType (type of well level measurement)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'WaterLevelTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about well data collection', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to Data Processing Level lookup table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';


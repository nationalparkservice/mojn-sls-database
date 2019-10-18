CREATE TABLE [data].[DischargePressureTransducer] (
    [ID]                  UNIQUEIDENTIFIER			  NOT NULL,
    [VisitID]			  UNIQUEIDENTIFIER            NOT NULL,
	[PTLoggerID]		  SMALLINT		 NOT NULL,
    [PTReading_ft]        DECIMAL (5, 2) NOT NULL,
    [PTReadingTime]       DATETIME2 (0)  NULL,
    [PTFileDownloadedID]  VARCHAR(2)        NOT NULL,
	[DownloadTime]         DATETIME2 (0) NULL,
	[RecordCount]          INT           NULL,
	[FileName]             VARCHAR (300) NULL,
    [PTMemoryClearedID]   VARCHAR(2)        NOT NULL,
    [PTBatteryReplacedID] VARCHAR(2)        NOT NULL,
    [BatteryLevel]    DECIMAL (5, 2) NULL,
	[BatteryLevelUnits]	  VARCHAR (4)	 NULL,
    [DateCreated]         DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_DischargePressureTransducer] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargePressureTransducer_PTReading_ft_range] CHECK ([PTReading_ft]>=(0) AND [PTReading_ft]<=(10)),
	CONSTRAINT [CK_DischargePTDownload_FileName_DisallowZeroLength] CHECK (len([FileName])>(0)),
    CONSTRAINT [CK_DischargePTDownload_RecordCount_range] CHECK ([RecordCount]>=(0)),
	CONSTRAINT [FK_DischargePressureTransducer_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
    CONSTRAINT [FK_DischargePressureTransducer_PTBatteryReplaced] FOREIGN KEY ([PTBatteryReplacedID]) REFERENCES [lookup].[YesNo] ([ID]),
    CONSTRAINT [FK_DischargePressureTransducer_PTFileDownloaded] FOREIGN KEY ([PTFileDownloadedID]) REFERENCES [lookup].[YesNo] ([ID]),
    CONSTRAINT [FK_DischargePressureTransducer_PTMemoryCleared] FOREIGN KEY ([PTMemoryClearedID]) REFERENCES [lookup].[YesNo] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Pressure transducer reading and download', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The pressure transducer used', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTLoggerID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Pressure transducer reading in feet', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTReading_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that pressure transducer was read', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTReadingTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTFileDownloaded (indicates whether pressure transducer data file was downloaded)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTFileDownloadedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that the pressure transducer file was downloaded', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'DownloadTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of data records in the downloaded file', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'RecordCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Path to the pressure transducer file on the shared drive', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'FileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTMemoryCleared (indicates whether pressure transducer memory was cleared)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTMemoryClearedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTBatteryReplaced (indicates whether pressure transducer battery was replaced)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'PTBatteryReplacedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Battery level of pressure transducer', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = 'BatteryLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Battery level units (typically V or %)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = 'BatteryLevelUnits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePressureTransducer', @level2type = N'COLUMN', @level2name = N'DateCreated';


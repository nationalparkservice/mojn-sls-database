CREATE TABLE [data].[WaterQualityTemperature] (
    [ID]                            UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]						UNIQUEIDENTIFIER	NOT NULL,
	[SubsiteID]						VARCHAR (15)	NULL,
	[TemperatureInstrumentID]		SMALLINT       NOT NULL,
	[IsDepthProfile]				VARCHAR (1)    NOT NULL,
	[MeasurementDepth_ft]			DECIMAL (5, 2) NULL,
	[DepthToBottom_ft]			    DECIMAL (5, 2) NULL,
	[Reading]						TINYINT		   NOT NULL,
    [WaterTemperature_C]            DECIMAL (5, 2) NOT NULL,
    [DataQualityFlagID]             TINYINT        NOT NULL,
    [DataQualityFlagNote]           VARCHAR (500)  NULL,
    [DateCreated]                   DATETIME2 (0)  CONSTRAINT [DF_WaterQualityTemp_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualityTemp] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityTemp_WaterTemperature_C_range] CHECK ([WaterTemperature_C]>=(-5) AND [WaterTemperature_C]<=(45) OR [WaterTemperature_C]=(-999)),
    CONSTRAINT [CK_WaterQualityTemp_DataQualityFlagNote_DisallowZeroLength] CHECK (len([DataQualityFlagNote])>(0)),
    CONSTRAINT [FK_WaterQualityTemp_Subsite] FOREIGN KEY ([SubsiteID]) REFERENCES [data].[Subsite] ([ID]),
    CONSTRAINT [FK_WaterQualityTemp_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
	CONSTRAINT [FK_WaterQualityTemp_DataQualityFlag] FOREIGN KEY ([DataQualityFlagID]) REFERENCES [lookup].[DataQualityFlag] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Water temperature measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Subsite code and foreign key to data.Subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = 'SubsiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.WaterQualityInstrument (in MOJN_SharedTables database)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'TemperatureInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates if measurement is part of a depth profile. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'IsDepthProfile';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Depth to which the WQ instrument was submerged, in feet (if depth profile)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'MeasurementDepth_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Water depth, in feet, at measurement location (if depth profile)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'DepthToBottom_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Reading number (i.e. order in which measurements were taken)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'Reading';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Temperature measurement in degrees Celsius', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'WaterTemperature_C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DataQualityFlag (indicates type and severity of data quality issue)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'DataQualityFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about data quality flag', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'DataQualityFlagNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'DateCreated';


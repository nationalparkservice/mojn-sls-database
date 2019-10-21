CREATE TABLE [data].[WaterQualitySpCond] (
    [ID]                            UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]						UNIQUEIDENTIFIER	NOT NULL,
	[SubsiteID]						VARCHAR (15)	NULL,
	[SpCondInstrumentID]		SMALLINT       NOT NULL,
	[IsDepthProfile]				VARCHAR (1)    NOT NULL,
	[MeasurementDepth_ft]			DECIMAL (5, 2) NULL,
	[DepthToBottom_ft]			    DECIMAL (5, 2) NULL,
	[Reading]						TINYINT		   NOT NULL,
    [SpecificConductance_microS_per_cm] DECIMAL (6, 1) NOT NULL,
    [DataQualityFlagID]                 TINYINT        NOT NULL,
    [DataQualityFlagNote]               VARCHAR (500)  NULL,
    [DateCreated]                       DATETIME2 (0)  CONSTRAINT [DF_WaterQualitySpCond_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [WaterQualitySpecificConductance_PK] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualitySpCond_DataQualityFlagNote_DisallowZeroLength] CHECK (len([DataQualityFlagNote])>(0)),
    CONSTRAINT [CK_WaterQualitySpCond_SpecificConductance_microS_per_cm_range] CHECK ([SpecificConductance_microS_per_cm]>=(0) AND [SpecificConductance_microS_per_cm]<=(200000) OR [SpecificConductance_microS_per_cm]=(-999)),
    CONSTRAINT [FK_WaterQualitySpCond_DataQualityFlag] FOREIGN KEY ([DataQualityFlagID]) REFERENCES [lookup].[DataQualityFlag] ([ID]),
    CONSTRAINT [FK_WaterQualitySpCond_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
	CONSTRAINT [FK_WaterQualitySpCond_WaterQualitySubsite] FOREIGN KEY ([SubsiteID]) REFERENCES [data].[Subsite] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Specific conductance measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Subsite code and foreign key to data.Subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = 'SubsiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.WaterQualityInstrument (in MOJN_SharedTables database)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'SpCondInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates if measurement is part of a depth profile. Foreign key to lookup.YesNo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'IsDepthProfile';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Depth to which the WQ instrument was submerged, in feet (if depth profile)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'MeasurementDepth_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Water depth, in feet, at measurement location (if depth profile)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'DepthToBottom_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Reading number (i.e. order in which measurements were taken)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'Reading';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Specific conductance measurement in microsiemens per centimeter', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'SpecificConductance_microS_per_cm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.DataQualityFlag (indicates type and severity of data quality issue)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'DataQualityFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about data quality flag', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'DataQualityFlagNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'DateCreated';


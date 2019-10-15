CREATE TABLE [data].[BMISample] (
    [ID]                        INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                   INT            NOT NULL,
    [SubsiteID]                 INT            NOT NULL,
    [NumberOfJarsUsed]          INT            NOT NULL,
    [BMISamplingMethodID]       TINYINT        NOT NULL,
    [BMIStartLocationID]        TINYINT        NOT NULL,
    [CollectionStart_m]         DECIMAL (5, 2) NULL,
    [CollectionEnd_m]           DECIMAL (5, 2) NULL,
    [NetSizeID]                 TINYINT        NOT NULL,
    [QuadratSizeID]             TINYINT        NOT NULL,
    [QuadratCount]              TINYINT        NOT NULL,
    [AreaSampled_sq_m]          DECIMAL (6, 2) NOT NULL,
    [QuadratSpacingEvenID]      TINYINT        NOT NULL,
    [DistanceBetweenQuadrats_m] DECIMAL (5, 2) NULL,
    [Notes]                     VARCHAR (1000) NULL,
    [DateCreated]               DATETIME2 (0)  CONSTRAINT [DF_BMISample_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BMISample] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_BMISample_CollectionEnd_m_range] CHECK ([CollectionEnd_m]>(0) AND [CollectionEnd_m]<(500) AND [CollectionEnd_m]>[CollectionStart_m] OR [CollectionEnd_m]=(-999)),
    CONSTRAINT [CK_BMISample_CollectionStart_m_range] CHECK ([CollectionStart_m]>=(0) AND [CollectionStart_m]<=(500) OR [CollectionStart_m]=(-999)),
    CONSTRAINT [CK_BMISample_DistanceBetweenQuadrats_m_range] CHECK ([DistanceBetweenQuadrats_m]>(0) AND [DistanceBetweenQuadrats_m]<=(50) OR [DistanceBetweenQuadrats_m]=(-999)),
    CONSTRAINT [CK_BMISample_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_BMISample_NumberOfJarsUsed_range] CHECK ([NumberOfJarsUsed]>=(1) AND [NumberOfJarsUsed]<=(6) OR [NumberOfJarsUsed]=(-999)),
    CONSTRAINT [CK_BMISample_QuadratCount_range] CHECK ([QuadratCount]>(0) AND [QuadratCount]<=(30) OR [QuadratCount]=(-999)),
    CONSTRAINT [FK_BMISample_BMISamplingMethod] FOREIGN KEY ([BMISamplingMethodID]) REFERENCES [lookup].[BMISamplingMethod] ([ID]),
    CONSTRAINT [FK_BMISample_BMIStartLocation] FOREIGN KEY ([BMIStartLocationID]) REFERENCES [lookup].[BMIStartLocation] ([ID]),
    CONSTRAINT [FK_BMISample_NetSize] FOREIGN KEY ([NetSizeID]) REFERENCES [ref].[NetSize] ([ID]),
    CONSTRAINT [FK_BMISample_QuadratSize] FOREIGN KEY ([QuadratSizeID]) REFERENCES [ref].[QuadratSize] ([ID]),
    CONSTRAINT [FK_BMISample_QuadratSpacingEven] FOREIGN KEY ([QuadratSpacingEvenID]) REFERENCES [lookup].[QuadratSpacingEven] ([ID]),
    CONSTRAINT [FK_BMISample_Subsite] FOREIGN KEY ([SubsiteID]) REFERENCES [data].[Subsite] ([ID]),
    CONSTRAINT [FK_BMISample_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_BMISample_VisitID_SubsiteID]
    ON [data].[BMISample]([VisitID] ASC, [SubsiteID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Information about benthic macroinvertebrate samples collected in the field', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Subsite (known locations within a spring (e.g. flume, source, pool) where sampling occurs)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'SubsiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of jars containing this sample (one sample may be split across multiple jars if it does not fit in a single jar)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'NumberOfJarsUsed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.BMISamplingMethod (benthic macroinvertebrate sampling methods)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'BMISamplingMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.BMIStartLocation (part of spring (e.g. weir, source) where first benthic macroinvertebrate sample was taken)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'BMIStartLocationID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance from start location to the first sample taken', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'CollectionStart_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance from start location to the last sample taken', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'CollectionEnd_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.NetSize (dimensions of BMI sampling net)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'NetSizeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.QuadratSize (dimensions of BMI sampling quadrat)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'QuadratSizeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Total number of quadrats', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'QuadratCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Total area sampled for benthic macroinvertebrates', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'AreaSampled_sq_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.QuadratSpacingEven (indicates whether BMI sampling quadrats were spaced evenly)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'QuadratSpacingEvenID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Distance separating sampling quadrats, if quadrat spacing was even', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'DistanceBetweenQuadrats_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes about this BMI sample', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'BMISample', @level2type = N'COLUMN', @level2name = N'DateCreated';


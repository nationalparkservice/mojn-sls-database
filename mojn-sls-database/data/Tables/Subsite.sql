CREATE TABLE [data].[Subsite] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]            INT            NOT NULL,
    [SubsiteName]       VARCHAR (50)   NOT NULL,
    [SubsiteCode]       VARCHAR (15)   NOT NULL,
    [BMICollected]      BIT            NOT NULL,
    [WQCollected]       BIT            NOT NULL,
    [IsActive]          BIT            NOT NULL,
    [UtmX_m]            DECIMAL (8, 2) NULL,
    [UtmY_m]            DECIMAL (9, 2) NULL,
    [UTMZoneID]         TINYINT        NULL,
    [HorizontalDatumID] TINYINT        NULL,
    [DateCreated]       DATETIME2 (0)  CONSTRAINT [DF_Subsite_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Subsite] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Subsite_SubsiteCode_DisallowZeroLength] CHECK (len([SubsiteCode])>(0)),
    CONSTRAINT [CK_Subsite_SubsiteName_DisallowZeroLength] CHECK (len([SubsiteName])>(0)),
    CONSTRAINT [CK_Subsite_UtmX_m_range] CHECK ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000)),
    CONSTRAINT [CK_Subsite_UtmY_m_range] CHECK ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000)),
    CONSTRAINT [FK_Subsite_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_Subsite_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID]),
    CONSTRAINT [FK_Subsite_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Subsite_SiteID_SubsiteCode]
    ON [data].[Subsite]([SiteID] ASC, [SubsiteCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Known locations within a spring (e.g. flume, source, pool), typically where repeat sampling or photopoints occur', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Site (the springs in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Subsite name', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'SubsiteName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Unique code assigned to each subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'SubsiteCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether BMI samples are collected at this subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'BMICollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether water quality data are collected at this subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'WQCollected';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether monitoring is currently ongoing at this subsite', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'UtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.UTMZone (zone associated with UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Subsite', @level2type = N'COLUMN', @level2name = N'DateCreated';


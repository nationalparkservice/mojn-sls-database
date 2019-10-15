CREATE TABLE [data].[WellSite] (
    [ID]                                   INT            IDENTITY (1, 1) NOT NULL,
    [SiteID]                               INT            NOT NULL,
    [LandSurfaceElevation_ft_above_NAVD88] DECIMAL (7, 2) NULL,
    [WellDepthBelowSurface_ft]             DECIMAL (5, 2) NULL,
    [ScreenTopDepthBelowSurface_ft]        DECIMAL (5, 2) NULL,
    [DateCreated]                          DATETIME2 (0)  CONSTRAINT [DF_Well_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Well] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_WellSite_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_Well_SiteID]
    ON [data].[WellSite]([SiteID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Well-specific site information (supplements general site info in the Site table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Site (the wells in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Elevation at well in feet above NAVD88', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'LandSurfaceElevation_ft_above_NAVD88';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Depth below ground surface that well was drilled', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'WellDepthBelowSurface_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Depth to the screen at the bottom of the well', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'ScreenTopDepthBelowSurface_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellSite', @level2type = N'COLUMN', @level2name = N'DateCreated';


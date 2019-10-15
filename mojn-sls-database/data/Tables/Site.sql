CREATE TABLE [data].[Site] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [ParkID]           INT            NOT NULL,
    [SiteTypeID]       TINYINT        NOT NULL,
    [Name]             VARCHAR (50)   NOT NULL,
    [Code]             VARCHAR (11)   NOT NULL,
    [AccessDirections] VARCHAR (4000) NULL,
    [X_UTM_NAD83_11N]  DECIMAL (8, 2) NOT NULL,
    [Y_UTM_NAD83_11N]  DECIMAL (9, 2) NOT NULL,
    [X_UTM_NAD83_12N]  DECIMAL (8, 2) NULL,
    [Y_UTM_NAD83_12N]  DECIMAL (9, 2) NULL,
    [Lat_WGS84]        DECIMAL (8, 6) NOT NULL,
    [Lon_WGS84]        DECIMAL (9, 6) NOT NULL,
    [DateCreated]      DATETIME2 (0)  CONSTRAINT [DF_Site_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Site_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Site_Name_DisallowZeroLength] CHECK (len([Name])>(0)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_11N_range] CHECK ([X_UTM_NAD83_11N]>=(200000) AND [X_UTM_NAD83_11N]<=(900000)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_12N_range] CHECK ([X_UTM_NAD83_12N]>=(200000) AND [X_UTM_NAD83_12N]<=(900000)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_11N_range] CHECK ([Y_UTM_NAD83_11N]>=(3500000) AND [Y_UTM_NAD83_11N]<=(4350000)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_12N_range] CHECK ([Y_UTM_NAD83_12N]>=(3500000) AND [Y_UTM_NAD83_12N]<=(4350000)),
    CONSTRAINT [FK_Site_SiteType] FOREIGN KEY ([SiteTypeID]) REFERENCES [lookup].[SiteType] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Site_Code]
    ON [data].[Site]([Code] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The springs contained in the sampling frame', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.Park (the park in which the site is located)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.SiteType (indicates whether site is a well or a spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'SiteTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site name', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Unique code assigned to each site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Directions to the site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'AccessDirections';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate (NAD83, zone 11N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate (NAD83, zone 11N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM X coordinate (NAD83, zone 12N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'UTM Y coordinate (NAD83, zone 12N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site latitude (WGS84)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lat_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Site longitude (WGS84)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lon_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'DateCreated';


CREATE TABLE [lookup].[SurfaceWaterPresent] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_SurfaceWaterPresent] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SurfaceWaterPresent_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_SurfaceWaterPresent_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_SurfaceWaterPresent_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_SurfaceWaterPresent_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates presence/absence of surface water (only at Smithwater)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SurfaceWaterPresent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SurfaceWaterPresent', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SurfaceWaterPresent', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SurfaceWaterPresent', @level2type = N'COLUMN', @level2name = N'Label';


CREATE TABLE [lookup].[WaterLevelType] (
    [ID]        TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]      VARCHAR (8)  NOT NULL,
    [Label]     VARCHAR (25) NOT NULL,
    [SortOrder] SMALLINT     NOT NULL,
    CONSTRAINT [PK_WaterLevelType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterLevelType_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_WaterLevelType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_WaterLevelType_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_WaterLevelType_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Type of well level measurement (USGS)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WaterLevelType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WaterLevelType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WaterLevelType', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WaterLevelType', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Sort order for items in this lookup', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WaterLevelType', @level2type = N'COLUMN', @level2name = N'SortOrder';


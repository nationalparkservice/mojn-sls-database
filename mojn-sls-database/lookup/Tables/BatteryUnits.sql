CREATE TABLE [lookup].[BatteryUnits] (
    [ID]    VARCHAR (2)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_BatteryUnits] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_BatteryUnits_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_BatteryUnits_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Units of battery level', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BatteryUnits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BatteryUnits', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BatteryUnits', @level2type = N'COLUMN', @level2name = N'Label';

GO
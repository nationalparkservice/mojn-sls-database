CREATE TABLE [lookup].[PTBatteryReplaced] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PTBatteryReplaced] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PTBatteryReplaced_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_PTBatteryReplaced_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_PTBatteryReplaced_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_PTBatteryReplaced_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether pressure transducer battery was replaced', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTBatteryReplaced';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTBatteryReplaced', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTBatteryReplaced', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTBatteryReplaced', @level2type = N'COLUMN', @level2name = N'Label';


CREATE TABLE [lookup].[WQDataTypes] (
    [ID]    VARCHAR (15)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_WQDataTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WQDataTypes_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_WQDataTypes_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Types of water quality data (e.g. pH, SpCond, etc.)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQDataTypes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQDataTypes', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQDataTypes', @level2type = N'COLUMN', @level2name = N'Label';

GO
CREATE TABLE [lookup].[PTMemoryCleared] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PTMemoryCleared] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PTMemoryCleared_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_PTMemoryCleared_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_PTMemoryCleared_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_PTMemoryCleared_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether pressure transducer memory was cleared', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTMemoryCleared';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTMemoryCleared', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTMemoryCleared', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PTMemoryCleared', @level2type = N'COLUMN', @level2name = N'Label';


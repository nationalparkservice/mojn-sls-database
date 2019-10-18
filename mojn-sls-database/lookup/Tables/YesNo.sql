CREATE TABLE [lookup].[YesNo] (
    [ID]    VARCHAR (2)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_YesNo] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_YesNo_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_YesNo_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Generic lookup for Yes/No/No Data', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNo', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'YesNo', @level2type = N'COLUMN', @level2name = N'Label';

GO
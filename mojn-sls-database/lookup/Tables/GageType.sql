CREATE TABLE [lookup].[GageType] (
    [ID]    VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (30) NOT NULL,
	[Description] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_GageType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_GageType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
	CONSTRAINT [CK_GageType_Description_DisallowZeroLength] CHECK (len([Description])>(0)),
    CONSTRAINT [UN_GageType_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Type of gage', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GageType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GageType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GageType', @level2type = N'COLUMN', @level2name = N'Label';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GageType', @level2type = N'COLUMN', @level2name = N'Description';

GO
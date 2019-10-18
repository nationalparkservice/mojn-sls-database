CREATE TABLE [lookup].[WQNotCollectedReason] (
    [ID]    VARCHAR (20)  NOT NULL,
    [Label] VARCHAR (30) NOT NULL,
	[Description] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_WQNotCollectedReason] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WQNotCollectedReason_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
	CONSTRAINT [CK_WQNotCollectedReason_Description_DisallowZeroLength] CHECK (len([Description])>(0)),
    CONSTRAINT [UN_WQNotCollectedReason_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Reason that missing water quality data were not collected', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQNotCollectedReason';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQNotCollectedReason', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQNotCollectedReason', @level2type = N'COLUMN', @level2name = N'Label';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WQNotCollectedReason', @level2type = N'COLUMN', @level2name = N'Description';

GO
CREATE TABLE [lookup].[Park] (
    [ID]         VARCHAR (4) NOT NULL,
    [Label]      VARCHAR (50) NOT NULL,
    [ShortLabel] VARCHAR (40) NOT NULL,
    CONSTRAINT [PK_Park] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Park_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Park_ShortLabel_DisallowZeroLength] CHECK (len([ShortLabel])>(0)),
    CONSTRAINT [UN_Park_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The park in which the spring is located', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table and 4-letter park code', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shortened label (abbreviates National Park to NP, etc.)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'ShortLabel';


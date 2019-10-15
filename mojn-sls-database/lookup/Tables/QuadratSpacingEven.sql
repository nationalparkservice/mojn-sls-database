CREATE TABLE [lookup].[QuadratSpacingEven] (
    [ID]    TINYINT      NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_QuadratSpacingEven] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_QuadratSpacingEven_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_QuadratSpacingEven_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_QuadratSpacingEven_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_QuadratSpacingEven_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether benthic macroinvertebrate sampling quadrats were evenly spaced', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'QuadratSpacingEven';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'QuadratSpacingEven', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'QuadratSpacingEven', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'QuadratSpacingEven', @level2type = N'COLUMN', @level2name = N'Label';


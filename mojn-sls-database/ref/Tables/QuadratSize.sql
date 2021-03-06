﻿CREATE TABLE [ref].[QuadratSize] (
    [ID]        TINYINT        NOT NULL,
    [Label]     VARCHAR (25)   NOT NULL,
    [Width_cm]  DECIMAL (3, 1) NOT NULL,
    [Height_cm] DECIMAL (3, 1) NOT NULL,
    CONSTRAINT [PK_QuadratSize] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_QuadratSize_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_QuadratSize_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Dimensions of benthic macroinvertebrate sampling quadrat', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'QuadratSize';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'QuadratSize', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'QuadratSize', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Width of quadrat in centimeters', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'QuadratSize', @level2type = N'COLUMN', @level2name = N'Width_cm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Height of quadrat in centimeters', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'QuadratSize', @level2type = N'COLUMN', @level2name = N'Height_cm';


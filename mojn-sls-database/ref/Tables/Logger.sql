﻿CREATE TABLE [ref].[Logger] (
    [ID]             TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (40)  NOT NULL,
    [Summary]        VARCHAR (200) NULL,
    [IsActive]       BIT           NOT NULL,
    [Manufacturer]   VARCHAR (20)  NOT NULL,
    [Model]          VARCHAR (40)  NOT NULL,
    [SerialNumber]   VARCHAR (40)  NULL,
    [NPSPropertyTag] VARCHAR (25)  NULL,
    [SortOrder]      TINYINT       NOT NULL,
    CONSTRAINT [PK_Logger] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Logger_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Logger_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_Logger_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_Logger_NPSPropertyTag_DisallowZeroLength] CHECK (len([NPSPropertyTag])>(0)),
    CONSTRAINT [CK_Logger_SerialNumber_DisallowZeroLength] CHECK (len([SerialNumber])>(0)),
    CONSTRAINT [CK_Logger_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_Logger_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Continuous data loggers', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether this item is a valid option for current data', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Equipment manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Equipment model', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Serial number assigned by manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'NPS property tag code', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'NPSPropertyTag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Sort order for items in this lookup', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Logger', @level2type = N'COLUMN', @level2name = N'SortOrder';


﻿CREATE TABLE [lookup].[BMIStartLocation] (
    [ID]      TINYINT       NOT NULL,
    [Code]    VARCHAR (10)  NOT NULL,
    [Label]   VARCHAR (25)  NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_BMIStartLocation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_BMIStartLocation_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_BMIStartLocation_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_BMIStartLocation_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_BMIStartLocation_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_BMIStartLocation_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Part of spring (e.g. weir, source) where first benthic macroinvertebrate sample was taken', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BMIStartLocation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BMIStartLocation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BMIStartLocation', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BMIStartLocation', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'BMIStartLocation', @level2type = N'COLUMN', @level2name = N'Summary';


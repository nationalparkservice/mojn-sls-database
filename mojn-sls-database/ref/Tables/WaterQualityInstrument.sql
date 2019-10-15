CREATE TABLE [ref].[WaterQualityInstrument] (
    [ID]             TINYINT       NOT NULL,
    [Label]          VARCHAR (50)  NOT NULL,
    [Summary]        VARCHAR (200) NULL,
    [Model]          VARCHAR (40)  NOT NULL,
    [Manufacturer]   VARCHAR (20)  NOT NULL,
    [NPSPropertyTag] VARCHAR (25)  NULL,
    [IsActive]       BIT           CONSTRAINT [DF_WaterQualityInstrument_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_WaterQualityInstrument] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityInstrument_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_NPSPropertyTag_DisallowZeroLength] CHECK (len([NPSPropertyTag])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_WaterQualityInstrument_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Instruments used for discrete water quality measurements', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Equipment model', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Equipment manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'NPS property tag code', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'NPSPropertyTag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether this item is a valid option for current data', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'IsActive';


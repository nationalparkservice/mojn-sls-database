CREATE TABLE [ref].[GPSUnit] (
    [ID]             TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (40)  NOT NULL,
    [Summary]        VARCHAR (200) NULL,
    [IsActive]       BIT           NOT NULL,
    [Manufacturer]   VARCHAR (20)  NULL,
    [Model]          VARCHAR (40)  NULL,
    [SerialNumber]   VARCHAR (40)  NULL,
    [NPSPropertyTag] VARCHAR (25)  NULL,
    [SortOrder]      TINYINT       NOT NULL,
    CONSTRAINT [PK_GPSUnit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_GPSUnit_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_GPSUnit_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_GPSUnit_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_GPSUnit_NPSPropertyTag_DisallowZeroLength] CHECK (len([NPSPropertyTag])>(0)),
    CONSTRAINT [CK_GPSUnit_SerialNumber_DisallowZeroLength] CHECK (len([SerialNumber])>(0)),
    CONSTRAINT [CK_GPSUnit_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_GPSUnit_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'GPS units, each with a unique identifier', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit';


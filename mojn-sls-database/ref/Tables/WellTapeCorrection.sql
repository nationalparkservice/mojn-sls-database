CREATE TABLE [ref].[WellTapeCorrection] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [CalibrationDate]   DATE           NOT NULL,
    [TapeCorrection_ft] DECIMAL (5, 2) NOT NULL,
    [Notes]             VARCHAR (500)  NULL,
    CONSTRAINT [PK_WellTapeCorrection] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Corrections for tape stretching and/or irregularities (determined by annual USGS calibration)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WellTapeCorrection';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WellTapeCorrection', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date calibration occurred (used to determine which tape correction to apply to well level data)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WellTapeCorrection', @level2type = N'COLUMN', @level2name = N'CalibrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Amount (in feet) to correct well level measurements by', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'WellTapeCorrection', @level2type = N'COLUMN', @level2name = N'TapeCorrection_ft';


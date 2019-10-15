CREATE TABLE [data].[WellLevel] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [WellActivityID]       INT            NOT NULL,
    [Time]                 DATETIME2 (0)  NULL,
    [Hold_ft]              DECIMAL (5, 2) NOT NULL,
    [Cut_ft]               DECIMAL (5, 2) NULL,
    [WellTapeCorrectionID] INT            NULL,
    [DateCreated]          DATETIME2 (0)  CONSTRAINT [DF_WellLevel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WellLevel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_WellLevel_WellActivity] FOREIGN KEY ([WellActivityID]) REFERENCES [data].[WellActivity] ([ID]),
    CONSTRAINT [FK_WellLevel_WellTapeCorrection] FOREIGN KEY ([WellTapeCorrectionID]) REFERENCES [ref].[WellTapeCorrection] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [IX_WellLevel_WellActivityID]
    ON [data].[WellLevel]([WellActivityID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_WellLevel_WellTapeCorrectionID]
    ON [data].[WellLevel]([WellTapeCorrectionID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Well level data', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.WellEvent (information about well visit)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'WellActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time well level was measured', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'Time';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Tape reading at mark point', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'Hold_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Tape reading at water surface', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'Cut_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WellTapeCorrection (correction for tape stretching and/or irregularities (determined by USGS calibration))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'WellTapeCorrectionID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WellLevel', @level2type = N'COLUMN', @level2name = N'DateCreated';


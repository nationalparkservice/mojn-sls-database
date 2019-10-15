CREATE TABLE [data].[DischargePoolStage] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [DischargeActivityID] INT            NOT NULL,
    [StartStaff_ft]       DECIMAL (5, 2) NOT NULL,
    [StartStaffTime]      DATETIME2 (0)  NULL,
    [EndStaff_ft]         DECIMAL (5, 2) NOT NULL,
    [EndStaffTime]        DATETIME2 (0)  NULL,
    [PTReading_ft]        DECIMAL (5, 2) NOT NULL,
    [PTReadingTime]       DATETIME2 (0)  NULL,
    [PTFileDownloadedID]  TINYINT        NOT NULL,
    [PTMemoryClearedID]   TINYINT        NOT NULL,
    [PTBatteryReplacedID] TINYINT        NOT NULL,
    [BatteryVoltage_V]    DECIMAL (5, 2) NULL,
    [DateCreated]         DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_DischargePoolStage] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargePoolStage_BatteryVoltage_V_range] CHECK ([BatteryVoltage_V]>=(0) AND [BatteryVoltage_V]<=(9) OR [BatteryVoltage_V]=(-999)),
    CONSTRAINT [CK_DischargePoolStage_EndStaff_ft_range] CHECK ([EndStaff_ft]>=(0) AND [EndStaff_ft]<=(7) OR [EndStaff_ft]=(-999)),
    CONSTRAINT [CK_DischargePoolStage_PTReading_ft_range] CHECK ([PTReading_ft]>=(0) AND [PTReading_ft]<=(5) OR [PTReading_ft]=(-999)),
    CONSTRAINT [CK_DischargePoolStage_StartStaff_ft_range] CHECK ([StartStaff_ft]>=(0) AND [StartStaff_ft]<=(7) OR [StartStaff_ft]=(-999)),
    CONSTRAINT [FK_DischargePoolStage_DischargeActivity] FOREIGN KEY ([DischargeActivityID]) REFERENCES [data].[DischargeActivity] ([ID]),
    CONSTRAINT [FK_DischargePoolStage_PTBatteryReplaced] FOREIGN KEY ([PTBatteryReplacedID]) REFERENCES [lookup].[PTBatteryReplaced] ([ID]),
    CONSTRAINT [FK_DischargePoolStage_PTFileDownloaded] FOREIGN KEY ([PTFileDownloadedID]) REFERENCES [lookup].[PTFileDownloaded] ([ID]),
    CONSTRAINT [FK_DischargePoolStage_PTMemoryCleared] FOREIGN KEY ([PTMemoryClearedID]) REFERENCES [lookup].[PTMemoryCleared] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DischargePoolStage_DischargeActivityID]
    ON [data].[DischargePoolStage]([DischargeActivityID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Pool stage readings', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.DischargeEvent (general discharge information) ', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'DischargeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Staff reading at the beginning of the monitoring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'StartStaff_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that start staff reading was taken', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'StartStaffTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Staff reading at the end of the monitoring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'EndStaff_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that end staff reading was taken', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'EndStaffTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Pressure transducer reading in feet', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'PTReading_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that pressure transducer was read', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'PTReadingTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTFileDownloaded (indicates whether pressure transducer data file was downloaded)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'PTFileDownloadedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTMemoryCleared (indicates whether pressure transducer memory was cleared)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'PTMemoryClearedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.PTBatteryReplaced (indicates whether pressure transducer battery was replaced)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'PTBatteryReplacedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Battery voltage of pressure transducer', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'BatteryVoltage_V';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePoolStage', @level2type = N'COLUMN', @level2name = N'DateCreated';


CREATE TABLE [data].[DischargePTDownload] (
    [ID]                   INT           IDENTITY (1, 1) NOT NULL,
    [DischargePoolStageID] INT           NOT NULL,
    [LoggerID]             TINYINT       NOT NULL,
    [DownloadTime]         DATETIME2 (0) NULL,
    [RecordCount]          INT           NULL,
    [FilePath]             VARCHAR (300) NOT NULL,
    [DateCreated]          DATETIME2 (0) CONSTRAINT [DF_DischargePTDownload_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargePTDownload] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargePTDownload_FilePath_DisallowZeroLength] CHECK (len([FilePath])>(0)),
    CONSTRAINT [CK_DischargePTDownload_RecordCount_range] CHECK ([RecordCount]>=(0)),
    CONSTRAINT [FK_DischargePTDownload_DischargePoolStage] FOREIGN KEY ([DischargePoolStageID]) REFERENCES [data].[DischargePoolStage] ([ID]),
    CONSTRAINT [FK_DischargePTDownload_Logger] FOREIGN KEY ([LoggerID]) REFERENCES [ref].[Logger] ([ID]),
    CONSTRAINT [UN_DischargePTDownload_FilePath] UNIQUE NONCLUSTERED ([FilePath] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DischargePTDownload_DischargePoolStageID_LoggerID]
    ON [data].[DischargePTDownload]([DischargePoolStageID] ASC, [LoggerID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Pressure transducer data download information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.DischargePoolStage (pool stage readings)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'DischargePoolStageID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Logger (which pressure transducer was used)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'LoggerID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that the pressure transducer file was downloaded', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'DownloadTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of data records in the downloaded file', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'RecordCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Path to the pressure transducer file on the shared drive', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'FilePath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargePTDownload', @level2type = N'COLUMN', @level2name = N'DateCreated';


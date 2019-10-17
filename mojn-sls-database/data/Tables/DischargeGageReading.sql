CREATE TABLE [data].[DischargeGageReading] (
    [ID]                  UNIQUEIDENTIFIER			  NOT NULL,
    [VisitID]			  UNIQUEIDENTIFIER            NOT NULL,
	[GageTypeID]		  VARCHAR(5)		 NOT NULL,
    [GageHeight_ft]        DECIMAL (5, 2) NOT NULL,
    [GageReadingTime]       DATETIME2 (0)  NULL,
    [DateCreated]         DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_DischargeGageReading] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeGageReading_GageHeight_ft_range] CHECK ([GageHeight_ft]>=(0)),
	CONSTRAINT [FK_DischargeGageReading_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Gage reading and download', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The type of gage used', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'GageTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Gage height reading in feet', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'GageHeight_ft';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time that gage was read', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'GageReadingTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeGageReading', @level2type = N'COLUMN', @level2name = N'DateCreated';


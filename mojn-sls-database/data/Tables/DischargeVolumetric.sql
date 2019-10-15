CREATE TABLE [data].[DischargeVolumetric] (
    [ID]                            UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]						UNIQUEIDENTIFIER	NOT NULL,
	[ContainerVolume_L]				SMALLINT			NOT NULL,
	[PercentFlowCaptured]			SMALLINT			NOT NULL,
	[FillTime_sec]					DECIMAL(5,2)		NOT NULL,
    [DateCreated]         DATETIME2 (0)  CONSTRAINT [DF_DischargeVolumetric_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeVolumetric] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeVolumetric_ContainerVolume_L_range] CHECK ([ContainerVolume_L]>(0)),
	CONSTRAINT [CK_DischargeVolumetric_PercentFlowCaptured_range] CHECK (([PercentFlowCaptured]>(0)) AND ([PercentFlowCaptured]<=(100))),
	CONSTRAINT [CK_DischargeVolumetric_FillTime_sec_range] CHECK ([FillTime_sec]>(0)),
    CONSTRAINT [FK_DischargeVolumetric_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Discharge data collected using the volumetric discharge method', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Volume in liters of the container used to capture flow', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'ContainerVolume_L';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Estimate of what percentage of total flow went into the container', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'PercentFlowCaptured';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Time it took to fill the container, in seconds', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'FillTime_sec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetric', @level2type = N'COLUMN', @level2name = N'DateCreated';

GO
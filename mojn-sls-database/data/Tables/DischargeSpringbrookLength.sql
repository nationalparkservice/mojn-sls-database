CREATE TABLE [data].[DischargeSpringbrookLength] (
    [ID]                    UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]				UNIQUEIDENTIFIER	NOT NULL,
    [OutletNumber]          TINYINT        NOT NULL,
    [OutletWaterPresent]    VARCHAR(1)     NOT NULL,
	[FlowsOverCliff]		VARCHAR (1)    NULL,
    [SpringbrookLength_m]   DECIMAL (5, 2) NOT NULL,
	[Notes]					VARCHAR (500)  NULL,
    [DateCreated]           DATETIME2 (0)  CONSTRAINT [DF_DischargeSpringbrookLength_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeSpringbrookLength] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeSpringbrookLength_OutletNumber_range] CHECK ([OutletNumber]>=(1) AND [OutletNumber]<=(10)),
    CONSTRAINT [CK_DischargeSpringbrookLength_SpringbrookLength_m_range] CHECK ([SpringbrookLength_m]>=(0) AND [SpringbrookLength_m]<=(200)),
    CONSTRAINT [FK_DischargeSpringbrookLength_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DischargeSpringbrookLength_DischargeActivityID_PoolNumber]
    ON [data].[DischargeSpringbrookLength]([VisitID] ASC, [OutletNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Springbrook length data (only at Smithwater)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number assigned to outlet', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'OutletNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.YesNo (indicates presence/absence of surface water)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'OutletWaterPresent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to lookup.YesNo (indicates whether Outlet 5 continues flowing over the cliff)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'FlowsOverCliff';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Length of springbrook', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'SpringbrookLength_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeSpringbrookLength', @level2type = N'COLUMN', @level2name = N'DateCreated';


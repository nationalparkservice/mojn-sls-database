CREATE TABLE [data].[DischargeOpenWaterArea] (
    [ID]                            UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]						UNIQUEIDENTIFIER	NOT NULL,
    [PoolNumber]          TINYINT        NOT NULL,
    [PoolArea_m_sq]       DECIMAL (6, 2) NOT NULL,
    [FrogCount]           SMALLINT       NOT NULL,
    [Notes]               VARCHAR (500)  NULL,
    [DateCreated]         DATETIME2 (0)  CONSTRAINT [DF_DischargeOpenWaterArea_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeOpenWaterArea] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeOpenWaterArea_FrogCount_range] CHECK ([FrogCount]>(0)),
    CONSTRAINT [CK_DischargeOpenWaterArea_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_DischargeOpenWaterArea_PoolArea_m_sq_range] CHECK ([PoolArea_m_sq]>(0) OR [PoolArea_m_sq]=(-999)),
    CONSTRAINT [CK_DischargeOpenWaterArea_PoolNumber_Range] CHECK ([PoolNumber]>=(1) AND [PoolNumber]<=(150) OR [PoolNumber]=(-999)),
    CONSTRAINT [FK_DischargeOpenWaterArea_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DischargeOpenWaterArea_DischargeActivityID_PoolNumber]
    ON [data].[DischargeOpenWaterArea]([VisitID] ASC, [PoolNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Discharge data collected using the open water area method (only at Fortynine Palms)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number assigned to pool (used only to identify pool sketches - pools do not retain the same number across visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'PoolNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Area of pool in square meters', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'PoolArea_m_sq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Number of frogs observed (anecdotal - not meant to be an exhaustive survey)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'FrogCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes regarding pool', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeOpenWaterArea', @level2type = N'COLUMN', @level2name = N'DateCreated';


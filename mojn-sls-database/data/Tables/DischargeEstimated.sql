CREATE TABLE [data].[DischargeEstimated] (
    [ID]                            UNIQUEIDENTIFIER	NOT NULL,
	[VisitID]						UNIQUEIDENTIFIER	NOT NULL,
    [EstDischargeMethod]               VARCHAR (500)  NOT NULL,
	[EstDischarge_L_per_sec]		DECIMAL(6,2)		NOT NULL,
    [DateCreated]         DATETIME2 (0)  CONSTRAINT [DF_DischargeEstimated_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeEstimated] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeEstimated_EstDischargeMethod_DisallowZeroLength] CHECK (len([EstDischargeMethod])>(0)),
    CONSTRAINT [CK_DischargeEstimated_EstDischarge_L_per_sec_range] CHECK ([EstDischarge_L_per_sec]>(0)),
    CONSTRAINT [FK_DischargeEstimated_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Discharge data collected using an estimated discharge method', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Description of method used to estimate discharge', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated', @level2type = N'COLUMN', @level2name = N'EstDischargeMethod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Estimated discharge in liters per second', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated', @level2type = N'COLUMN', @level2name = N'EstDischarge_L_per_sec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimated', @level2type = N'COLUMN', @level2name = N'DateCreated';

GO
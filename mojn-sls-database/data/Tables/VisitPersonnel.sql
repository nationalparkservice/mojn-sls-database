﻿CREATE TABLE [data].[VisitPersonnel] (
    [VisitID]         UNIQUEIDENTIFIER           NOT NULL,
    [PersonnelID]     INT           NOT NULL,
    [DateCreated]     DATETIME2 (0) CONSTRAINT [DF_VisitPersonnel_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_VisitPersonnel] PRIMARY KEY CLUSTERED ([VisitID] ASC, [PersonnelID] ASC),
    CONSTRAINT [FK_VisitPersonnel_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Crossreference table; lists people involved in data collection, management, and analysis for each sampling visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VisitPersonnel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VisitPersonnel', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Personnel (personnel involved in data collection or management)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VisitPersonnel', @level2type = N'COLUMN', @level2name = N'PersonnelID';


GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'VisitPersonnel', @level2type = N'COLUMN', @level2name = N'DateCreated';


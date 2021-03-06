﻿CREATE TABLE [data].[PhotoActivity] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT           NOT NULL,
    [CameraID]                TINYINT       NOT NULL,
    [CameraCardID]            SMALLINT      NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_PhotoActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_PhotoActivity_DataProcessingLevelDate1] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_PhotoActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PhotoActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PhotoActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [FK_PhotoActivity_Camera] FOREIGN KEY ([CameraID]) REFERENCES [ref].[Camera] ([ID]),
    CONSTRAINT [FK_PhotoActivity_CameraCard] FOREIGN KEY ([CameraCardID]) REFERENCES [ref].[CameraCard] ([ID]),
    CONSTRAINT [FK_PhotoActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_PhotoActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_PhotoActivity_VisitID]
    ON [data].[PhotoActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'General photo information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.Camera (cameras used for monitoring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'CameraID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to ref.CameraCard (camera memory cards)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'CameraCardID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Foreign key to Data Processing Level lookup table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';


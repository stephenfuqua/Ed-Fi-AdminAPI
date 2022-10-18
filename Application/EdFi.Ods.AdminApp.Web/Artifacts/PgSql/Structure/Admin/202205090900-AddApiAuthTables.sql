-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE adminapi.Applications (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    ConcurrencyToken VARCHAR(128) NULL,
    ClientId VARCHAR(256) NULL,
    ClientSecret VARCHAR(256) NULL,
    Type VARCHAR(256) NULL,
    ConsentType VARCHAR(256) NULL,
    Permissions VARCHAR NULL,
    Properties VARCHAR NULL,
    Requirements VARCHAR NULL,
    DisplayName VARCHAR(256) NULL,
    DisplayNames VARCHAR NULL,
    RedirectUris VARCHAR NULL,
    PostLogoutRedirectUris VARCHAR NULL,
    CONSTRAINT PK_Applications PRIMARY KEY (Id)
);

CREATE TABLE adminapi.Scopes (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    Name VARCHAR(256) NULL,
    ConcurrencyToken VARCHAR(128) NULL,
    Description VARCHAR NULL,
    Descriptions VARCHAR NULL,
    DisplayName VARCHAR(256) NULL,
    DisplayNames VARCHAR NULL,
    Properties VARCHAR NULL,
    Resources VARCHAR NULL,
    CONSTRAINT PK_Scopes PRIMARY KEY (Id)
);

CREATE TABLE adminapi.Authorizations (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    ConcurrencyToken VARCHAR(128) NULL,
    ApplicationId int NOT NULL,
    Scopes VARCHAR NULL,
    Subject VARCHAR(256) NULL,
    Status VARCHAR(256) NULL,
    Properties VARCHAR NULL,
    CreationDate TIMESTAMP NULL,
    CONSTRAINT PK_Authorizations PRIMARY KEY (Id),
    CONSTRAINT FK_AuthorizationsId_ApplicationId FOREIGN KEY (ApplicationId) REFERENCES adminapi.Applications (Id) ON DELETE RESTRICT
);

CREATE TABLE adminapi.Tokens (
    Id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    ConcurrencyToken VARCHAR(128) NULL,
    ApplicationId int NULL,
    AuthorizationId int NULL,
    Type VARCHAR(256) NULL,
    CreationDate TIMESTAMP NULL,
    ExpirationDate TIMESTAMP NULL,
    RedemptionDate TIMESTAMP NULL,
    Payload VARCHAR NULL,
    Properties VARCHAR NULL,
    Subject VARCHAR(256) NULL,
    Status VARCHAR(256) NULL,
    ReferenceId VARCHAR(256) NULL,
    CONSTRAINT PK_Tokens PRIMARY KEY (Id)
);

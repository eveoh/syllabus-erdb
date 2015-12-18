
CREATE NONCLUSTERED INDEX [zones_name] ON [rdowner].[V_ZONES]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [studentset_name] ON [rdowner].[V_STUDENTSET]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [staff_name] ON [rdowner].[V_STAFF]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [module_name] ON [rdowner].[V_MODULE]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [location_name] ON [rdowner].[V_LOCATION]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [department_name] ON [rdowner].[V_DEPARTMENT]
(
    [Name] ASC
);
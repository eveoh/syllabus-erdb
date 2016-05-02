CREATE NONCLUSTERED INDEX [zones_name] ON [rdowner].[ZONES]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [studentset_name] ON [rdowner].[STUDENT_SET]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [staff_name] ON [rdowner].[STAFF]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [module_name] ON [rdowner].[MODULE]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [location_name] ON [rdowner].[LOCATION]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [department_name] ON [rdowner].[DEPARTMENTS]
(
    [Name] ASC
);

CREATE NONCLUSTERED INDEX [pos_name] ON [rdowner].[POS]
(
    [Name] ASC
);
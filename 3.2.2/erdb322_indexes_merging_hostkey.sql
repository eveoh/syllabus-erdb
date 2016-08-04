CREATE NONCLUSTERED INDEX [zones_hostkey] ON [rdowner].[ZONES]
(
    [host_key] ASC
);

CREATE NONCLUSTERED INDEX [module_hostkey] ON [rdowner].[MODULE]
(
    [host_key] ASC
);

CREATE NONCLUSTERED INDEX [location_hostkey] ON [rdowner].[LOCATION]
(
    [host_key] ASC
);

CREATE NONCLUSTERED INDEX [department_hostkey] ON [rdowner].[DEPARTMENTS]
(
    [host_key] ASC
);

CREATE NONCLUSTERED INDEX [pos_hostkey] ON [rdowner].[POS]
(
    [host_key] ASC
);
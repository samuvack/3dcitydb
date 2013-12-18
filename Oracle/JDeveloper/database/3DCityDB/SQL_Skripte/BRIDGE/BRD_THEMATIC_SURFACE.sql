CREATE TABLE BRD_THEMATIC_SURFACE 
(
  ID NUMBER NOT NULL 
, OBJECTCLASS_ID NUMBER 
, BRIDGE_ID NUMBER 
, BRIDGE_ROOM_ID NUMBER 
, BRIDGE_INSTALLATION_ID NUMBER 
, BRIDGE_CONSTR_ELEM_ID NUMBER 
, LOD2_MULTI_SURFACE_ID NUMBER 
, LOD3_MULTI_SURFACE_ID NUMBER 
, LOD4_MULTI_SURFACE_ID NUMBER 
, CONSTRAINT BIRDGE_THEMATIC_SURFACE_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX BRD_THEMATIC_SURFACE_PK ON BRD_THEMATIC_SURFACE (ID ASC) 
      LOGGING 
      TABLESPACE "USERS" 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX ON BRD_THEMATIC_SURFACE (BRIDGE_ROOM_ID) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX1 ON BRD_THEMATIC_SURFACE (BRIDGE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX2 ON BRD_THEMATIC_SURFACE (LOD2_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX3 ON BRD_THEMATIC_SURFACE (LOD3_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX4 ON BRD_THEMATIC_SURFACE (LOD4_MULTI_SURFACE_ID ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX5 ON BRD_THEMATIC_SURFACE (BRIDGE_INSTALLATION_ID ASC);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX6 ON BRD_THEMATIC_SURFACE (BRIDGE_CONSTR_ELEM_ID ASC);

CREATE INDEX BRD_THEMATIC_SURFACE_FKX7 ON BRD_THEMATIC_SURFACE (OBJECTCLASS_ID ASC);

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_CLASS_FK FOREIGN KEY
(
  OBJECTCLASS_ID 
)
REFERENCES OBJECTCLASS
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK FOREIGN KEY
(
  BRIDGE_ID 
)
REFERENCES BRIDGE
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK2 FOREIGN KEY
(
  BRIDGE_CONSTR_ELEM_ID 
)
REFERENCES BRD_CONSTR_ELEMENT
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK3 FOREIGN KEY
(
  BRIDGE_INSTALLATION_ID 
)
REFERENCES BRIDGE_INSTALLATION
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK4 FOREIGN KEY
(
  BRIDGE_ROOM_ID 
)
REFERENCES BRIDGE_ROOM
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK5 FOREIGN KEY
(
  ID 
)
REFERENCES CITYOBJECT
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK6 FOREIGN KEY
(
  LOD2_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK7 FOREIGN KEY
(
  LOD3_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;

ALTER TABLE BRD_THEMATIC_SURFACE
ADD CONSTRAINT BRD_THEMATIC_SURFACE_FK8 FOREIGN KEY
(
  LOD4_MULTI_SURFACE_ID 
)
REFERENCES SURFACE_GEOMETRY
(
  ID 
)
ENABLE;
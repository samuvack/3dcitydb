-- 3D City Database - The Open Source CityGML Database
-- http://www.3dcitydb.org/
-- 
-- Copyright 2013 - 2016
-- Chair of Geoinformatics
-- Technical University of Munich, Germany
-- https://www.gis.bgu.tum.de/
-- 
-- The 3D City Database is jointly developed with the following
-- cooperation partners:
-- 
-- virtualcitySYSTEMS GmbH, Berlin <http://www.virtualcitysystems.de/>
-- M.O.S.S. Computer Grafik Systeme GmbH, Taufkirchen <http://www.moss.de/>
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
--     
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

/*****************************************************************
* CONTENT
*
* FUNCTIONS:
*   table_content(table_name TEXT, schema_name TEXT DEFAULT 'citydb') RETURNS INTEGER
*   table_contents(schema_name TEXT DEFAULT 'citydb') RETURNS TEXT[]
******************************************************************/

/*****************************************************************
* table_contents
*
* @param schema_name name of schema
* @RETURN TEXT[] database report as text array
******************************************************************/
CREATE OR REPLACE FUNCTION citydb_pkg.table_contents(schema_name TEXT DEFAULT 'citydb') RETURNS TEXT[] AS $$
DECLARE
  report_header TEXT[] := '{}'; 
  report TEXT[] := '{}';
BEGIN
  report_header := array_append(report_header, 'Database Report on 3D City Model - Report date: ' || TO_CHAR(now()::timestamp, 'DD.MM.YYYY HH24:MI:SS'));
  report_header := array_append(report_header, '===================================================================');
  PERFORM array_append(report_header, '');

  EXECUTE 'SELECT array_agg(t) FROM 
             (SELECT ''#'' || upper(table_name) ||
                (CASE WHEN length(table_name) < 7 THEN E''\t\t\t\t''
                      WHEN length(table_name) > 6 AND length(table_name) < 15 THEN E''\t\t\t''
                      WHEN length(table_name) > 14 AND length(table_name) < 23 THEN E''\t\t''
                      WHEN length(table_name) > 22 THEN E''\t''
                END)
			 || citydb_pkg.table_content(table_name, table_schema) AS t 
                FROM information_schema.tables WHERE table_schema = $1 
                AND table_name != ''database_srs'' 
                AND table_name != ''objectclass'' 
                AND table_name NOT LIKE ''tmp_%''
                ORDER BY table_name ASC
              ) tab' INTO report USING schema_name;

  report := array_cat(report_header,report);
  
  RETURN report;
END;
$$
LANGUAGE plpgsql;


/*****************************************************************
* table_content
*
* @param schema_name name of schema
* @param table_name name of table
* @RETURN INTEGER number of entries in table
******************************************************************/
CREATE OR REPLACE FUNCTION citydb_pkg.table_content(
  table_name TEXT,
  schema_name TEXT DEFAULT 'citydb'
  ) RETURNS INTEGER AS $$
DECLARE
  cnt INTEGER;  
BEGIN
  EXECUTE format('SELECT count(*) FROM %I.%I', schema_name, table_name) INTO cnt;
  RETURN cnt;
END;
$$
LANGUAGE plpgsql;
#!/usr/bin/env sh

dropdb meowtime
createdb meowtime
psql catfactory < data/cat_tables.sql

# ZSRA_STUDENT – Database Table Documentation

## 1. Overview

**Table Name:** ZSRA_STUDENT  
**Description:** Student Table  
**Table Type:** Transparent Table  
**Status:** Active  
**Technology:** SAP ABAP Dictionary (SE11)

## 2. Table Structure

| Field Name | Data Element | Data Type | Length | Decimals | Key |
|---|---|---|---:|---:|---|
| MANDT | MANDT | CLNT | 3 | 0 | Yes |
| STUDENT_ID | ZSRA_STUDENT_ID | CHAR | 5 | 0 | Yes |
| STUDENT_NAME | ZSRA_STUDENT_NAME | CHAR | 30 | 0 | No |
| DEPARTMENT | ZSRA_DEPARTMENT | CHAR | 10 | 0 | No |
| AGE | ZSRA_AGE | INT4 | 10 | 0 | No |
| MARKS | ZSRA_MARKS | DEC | 5 | 2 | No |

## 3. Primary Key

The primary key consists of:
- MANDT – SAP Client
- STUDENT_ID – Unique Student Identifier within the client

## 4. Purpose

The ZSRA_STUDENT table stores student information used by the Student Management System.

It supports:
- Student insertion
- Student searching
- Student updating
- Student deletion
- Student validation
- Student reporting and ALV display

## 5. Development Environment

- SAP GUI
- SAP Learning Hub Practice System
- ABAP Dictionary (SE11)
- Open SQL

## 6. Screenshot

Refer to `../Screenshots/Database_Table.png` for the database table structure.

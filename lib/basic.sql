-- outline of schema SQL, 3 main tables

CREATE DATABASE QX_data

CREATE TABLE UserInfo (
  userID INT primary key,
  UserLastName VARCHAR(30) NOT NULL,
  UserFirstName VARCHAR(30) NOT NULL,
  UserMiddleInitial CHAR NOT NULL,
  UserAddressLine1 VARCHAR(30) NOT NULL,
  UserCity VARCHAR(30) NOT NULL,
  UserState VARCHAR(30) NOT NULL,
  UserZipCode INT NOT NULL,
  UserCountry VARCHAR(30) NOT NULL,
  UserPhone INT,
  UserEmail VARCHAR(30) NOT NULL,
  UserSocMedia VARCHAR(30),CREATE TABLE UserInfo (
  userID INT primary key,
  UserLastName VARCHAR(30) NOT NULL,
  UserFirstName VARCHAR(30) NOT NULL,
  UserMiddleInitial CHAR NOT NULL,
  UserAddressLine1 VARCHAR(30) NOT NULL,
  UserCity VARCHAR(30) NOT NULL,
  UserState VARCHAR(30) NOT NULL,
  UserZipCode INT NOT NULL,
  UserCountry VARCHAR(30) NOT NULL,
  UserPhone INT,
  UserEmail VARCHAR(30) NOT NULL,
  UserSocMedia VARCHAR(30),
  UserExperience CLOB,
  UserEducation CLOB,
  UserBirthdate DATETIME NOT NULL,
  UserCitizen BIT NOT NULL,
  UserReferences CLOB,
  UserInterests CLOB
  UserResume BLOB,
 );

 CREATE TABLE JobInfo (
   JobID INT primary key,
   JobName VARCHAR(30) NOT NULL,
   JobDescription CLOB,
   JobEmail VARCHAR(30) NOT NULL,
   JobPhone INT NOT NULL,
   JobDatePosted DATETIME,
   JobAddress VARCHAR(30) NOT NULL,
   JobWage VARCHAR(30) NOT NULL,
   JobHours VARCHAR(30) NOT NULL,
   JobType VARCHAR(30),
   JobQualifications CLOB,
   JobInterests VARCHAR(30),
   JobAppDeadline DATETIME NOT NULL,
   JobFlexible BIT, NOT NULL
 );
 
 CREATE TABLE ServiceInfo (
   ServiceID INT primary key,
   ServiceName VARCHAR(30) NOT NULL,
   ServiceDescription CLOB,
   ServiceEmail VARCHAR(30) NOT NULL,
   ServiceLocation VARCHAR(30) NOT NULL,
   ServiceTransportation BIT,
   ServiceHours VARCHAR(30) NOT NULL,
   ServiceInterests VARCHAR(30),
   ServiceAppDeadline DATETIME NOT NULL,
 );
 
 /* starting of PL/SQL 
  * some of this is dependant on python code from seperate source
  * python source includes algorythm for percent match system and
  * backend communication with the controller and model to return
  * views and data from this database.
  */
 
  -- view for results of percent match system (tentative)
  CREATE VIEW percent_match_results  AS 
  SELECT JobWage, JobAddress, JobFlexible JobHours
  FROM JobInfo 
  [WHERE ]; -- conditions go here from percent match code
  
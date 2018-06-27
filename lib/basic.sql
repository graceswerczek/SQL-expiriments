CREATE TABLE UserInfo (
  userID INT primary key,
  UserLastName VARCHAR NOT NULL,
  UserFirstName VARCHAR NOT NULL,
  UserMiddleInitial CHAR NOT NULL,
  UserAddressLine1 VARCHAR NOT NULL,
  UserCity VARCHAR NOT NULL,
  UserState VARCHAR NOT NULL,
  UserZipCode INT NOT NULL,
  UserCountry VARCHAR NOT NULL,
  UserPhone INT,
  UserEmail VARCHAR NOT NULL,
  UserSocMedia VARCHAR,
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
   JobName VARCHAR NOT NULL,
   JobDescription CLOB,
   JobEmail VARCHAR NOT NULL,
   JobPhone INT NOT NULL,
   JobDatePosted DATETIME,
   JobAddress VARCHAR NOT NULL,
   JobWage VARCHAR NOT NULL,
   JobHours VARCHAR NOT NULL,
   JobType VARCHAR,
   JobQualifications CLOB,
   JobInterests VARCHAR,
   JobAppDeadline DATETIME NOT NULL,
 );
 
 CREATE TABLE ServiceInfo (
   ServiceID INT primary key,
   ServiceName VARCHAR NOT NULL,
   ServiceDescription CLOB,
   ServiceEmail VARCHAR NOT NULL,
   ServiceLocation VARCHAR NOT NULL,
   ServiceTransportation BIT,
   ServiceHours VARCHAR NOT NULL,
   ServiceInterests VARCHAR,
   ServiceAppDeadline DATETIME NOT NULL,
 );
 
 
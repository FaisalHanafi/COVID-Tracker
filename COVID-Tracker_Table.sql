DROP TABLE SUPERVISOR_PROJ cascade constraints;
DROP TABLE MAHALLAH_PROJ cascade constraints;
DROP TABLE STUDENT_PROJ cascade constraints;
DROP TABLE PRESCRIPTION_PROJ cascade constraints;
DROP TABLE ADMISSION_PROJ cascade constraints;

CREATE TABLE SUPERVISOR_PROJ
 (STAFF_ID                                             NUMBER(5),
 STAFF_NAME                                            VARCHAR2(30),
 CONTACT_NUMBER                                        NUMBER(11),
 EMAIL                                                 VARCHAR2(50),
	CONSTRAINT SUPERVISOR_PROJ_STAFF_ID_PK PRIMARY KEY (STAFF_ID));
    
CREATE TABLE MAHALLAH_PROJ
 (MAHALLAH_ID                                       NUMBER(2),
 MAHALLAH_NAME                                      VARCHAR2(30),
 MAHALLAH_GENDER                                    VARCHAR2(6),
 MAHALLAH_CAPACITY                                  NUMBER(4),
 STAFF_ID                                           NUMBER(5),
	CONSTRAINT MAHALLAH_PROJ_MAHALLAH_ID_PK PRIMARY KEY (MAHALLAH_ID),
    CONSTRAINT SUPERVISOR_PROJ_STAFF_ID_FK FOREIGN KEY(STAFF_ID)
		REFERENCES SUPERVISOR_PROJ);

    
CREATE TABLE STUDENT_PROJ
 (STUDENT_ID                                         NUMBER(7),
 STUDENT_NAME                                        VARCHAR2(30),
 CITIZENSHIP                                         VARCHAR2(15),
 IC_PASSPORT                                         VARCHAR2(12),
 MAHALLAH_ID                                         NUMBER(2),
 MAHALLAH_BLOCK                                      CHAR(1),
 ROOM                                                NUMBER(3),
 SECTION                                             CHAR(1),
	CONSTRAINT STUDENT_PROJ_STUDENT_ID_PK PRIMARY KEY (STUDENT_ID),
    CONSTRAINT MAHALLAH_PROJ_MAHALLAH_ID_FK FOREIGN KEY(MAHALLAH_ID)
		REFERENCES MAHALLAH_PROJ);

CREATE TABLE PRESCRIPTION_PROJ
 (PRESCRIPTION_ID                                NUMBER(6),
 DRUG_NAME1                                      VARCHAR2(30),
 DRUG_NAME2                                      VARCHAR2(30),
 DRUG_NAME3                                      VARCHAR2(30),
 SYMPTOM                                         VARCHAR2(30),
	CONSTRAINT PRESCRIPTION_PROJ_PRESCRIPTION_ID_PK PRIMARY KEY (PRESCRIPTION_ID));
    
CREATE TABLE ADMISSION_PROJ
 (ADMISSION_ID                                  NUMBER(7),
 DATE_ADMITTED                                  DATE,
 DATE_DISCHARGED                                DATE,
 STUDENT_ID                                     NUMBER(7),
 PRESCRIPTION_ID                                NUMBER(6),
 HOSPITAL_NAME                                  VARCHAR2(30),
 WARD_NAME                                      VARCHAR2(10),
 BED_ID                                         NUMBER(5),         
 
	CONSTRAINT ADMISSION_PROJ_ADMISSION_ID_PK PRIMARY KEY (ADMISSION_ID),
    CONSTRAINT STUDENT_PROJ_STUDENT_ID_FK FOREIGN KEY(STUDENT_ID)
		REFERENCES STUDENT_PROJ,
    CONSTRAINT PRESCRIPTION_PROJ_PRESCRIPTION_ID_FK FOREIGN KEY(PRESCRIPTION_ID)
		REFERENCES PRESCRIPTION_PROJ);
        
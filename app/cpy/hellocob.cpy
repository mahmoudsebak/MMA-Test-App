       *******************************************************************
       * COPYBOOK: hellocob.cpy
       *
       * This copybook defines a simple record structure used by the
       * HELLOCOB COBOL program.  It declares input fields for a name,
       * age and salary.  The fields are grouped under a single 01‑level
       * to allow the entire record to be referenced collectively.
       *******************************************************************

        01  HELLOCOB-RECORD.
            05  IN-NAME    PIC X(30).
            05  IN-AGE     PIC 99.
            05  IN-SALARY  PIC S9(5)V99.
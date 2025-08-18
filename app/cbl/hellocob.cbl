      *****************************************************************
      * PROGRAM: hellocob.cbl
      *
      * This is a very simple COBOL batch program that demonstrates
      * how to include both a record copybook and a BMS copybook.  The
      * program moves constant values into the record fields defined in
      * hellocob.cpy and then copies those values into the BMS map
      * fields defined in hellocob_map.cpy.  The values are displayed
      * using the DISPLAY verb to show how the data can be referenced.
      *****************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOCOB.
       AUTHOR.      GENERATED-BY-CHATGPT.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       * Include the record structure copybook
       COPY HELLOCOB.
       * Include the BMS map copybook
       COPY HELLOCOB-MAP.

       * Local working storage
       01  WS-MESSAGE        PIC X(80)
           VALUE 'This is a simple COBOL program demonstration.'.

       PROCEDURE DIVISION.

       MAIN-PARA.
           * Display a heading message
           DISPLAY WS-MESSAGE

           * Populate record fields
           MOVE 'John Doe'       TO IN-NAME
           MOVE 25               TO IN-AGE
           MOVE +12345.67        TO IN-SALARY

           * Display the raw input values
           DISPLAY 'Name   : ' IN-NAME
           DISPLAY 'Age    : ' IN-AGE
           DISPLAY 'Salary : ' IN-SALARY

           * Populate BMS map field lengths and attributes
           MOVE 15              TO HELLOCOB-NAMEL
           MOVE 2               TO HELLOCOB-AGEL
           MOVE SPACE           TO HELLOCOB-NAMEA HELLOCOB-NAMET
           MOVE SPACE           TO HELLOCOB-AGEA  HELLOCOB-AGET

           * Copy values into the BMS map fields
           MOVE IN-NAME         TO HELLOCOB-NAMEI
           MOVE IN-AGE          TO HELLOCOB-AGEI

           * Display the BMS map fields to demonstrate the copy
           DISPLAY 'Map Name Field: ' HELLOCOB-NAMEI
           DISPLAY 'Map Age  Field: ' HELLOCOB-AGEI

           * End the program
           GOBACK.
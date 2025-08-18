       *******************************************************************
       * COPYBOOK: hellocob_map.cpy
       *
       * This BMS copybook corresponds to the HELLOCOB BMS map.  It
       * defines the screen fields as they are presented to the COBOL
       * program.  Each field consists of four components: length (L),
       * attribute (A), data (I) and a trailing byte (T).  These names
       * follow the standard CICS BMS naming convention.  The COBOL
       * program can reference these fields individually or via the
       * group items defined here.
       *******************************************************************

        01  HELLOCOB-MAP.
            03  HELLOCOB-NAMEO.
                05  HELLOCOB-NAMEL  PIC S9(4)     COMP.
                05  HELLOCOB-NAMEA  PIC X.
                05  HELLOCOB-NAMEI  PIC X(15).
                05  HELLOCOB-NAMET  PIC X.
            03  HELLOCOB-AGEO.
                05  HELLOCOB-AGEL   PIC S9(4)     COMP.
                05  HELLOCOB-AGEA   PIC X.
                05  HELLOCOB-AGEI   PIC X(3).
                05  HELLOCOB-AGET   PIC X.
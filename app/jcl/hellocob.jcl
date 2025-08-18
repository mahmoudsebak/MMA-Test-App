/* ----------------------------------------------------------------- *
/* SAMPLE JCL to assemble the BMS map, compile the HELLOCOB COBOL     *
/* program and run it.                                                *
/*                                                                   *
/* Replace MY.COPYLIB, MY.SOURCE and MY.LOAD with appropriate data   *
/* set names on your system.  The BMS assembler step produces the    *
/* copybook hellocob_map.cpy that is included by the COBOL program.   *
/* ----------------------------------------------------------------- *
//HELLOCOB JOB (ACCOUNT),'HELLO COBOL BMS JOB',CLASS=A,MSGCLASS=A
//* Step 1: Assemble the BMS map (hellocob.bms)
//ASM      EXEC PGM=ASMA90
//SYSPRINT DD   SYSOUT=*
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSLIB   DD   DSN=SYS1.MACLIB,DISP=SHR
//SYSIN    DD   DSN=MY.SOURCE(HELCOBB),DISP=SHR
//SYSPUNCH DD   DSN=MY.COPYLIB(HELLOCOB-MAP),DISP=SHR
//*
//* Step 2: Compile the COBOL program
//COBCL    EXEC PGM=IGYCRCTL
//STEPLIB  DD   DSN=SYS1.COBLIB,DISP=SHR
//SYSLIB   DD   DSN=MY.COPYLIB,DISP=SHR
//SYSIN    DD   DSN=MY.SOURCE(HELLOCOB),DISP=SHR
//SYSLIN   DD   DSN=&&OBJ(HELLOCOB),DISP=(MOD,PASS)
//SYSPRINT DD   SYSOUT=*
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT2   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT3   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT4   DD   UNIT=SYSDA,SPACE=(CYL,(1,1))
//*
//* Step 3: Link edit
//LKED     EXEC PGM=IEWL,COND=(4,LT)
//SYSLIN   DD   DSN=&&OBJ(HELLOCOB),DISP=(OLD,PASS)
//SYSLMOD  DD   DSN=MY.LOAD(HELLOCOB),DISP=(NEW,CATLG),
//           UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSPRINT DD   SYSOUT=*
//*
//* Step 4: Run the program
//RUN      EXEC PGM=HELLOCOB,COND=(4,LT)
//STEPLIB  DD   DSN=MY.LOAD,DISP=SHR
//SYSOUT   DD   SYSOUT=*
//SYSIN    DD   DUMMY
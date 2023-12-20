# Basic Progress Lang

## Chapter 01 : Variables

These variables are declared with `NO-UNDO`.
That states that no undo handling is wanted for this specific variable in case of a transactional roll-back.

This should always be the default unless transactional control over this variable is a requirement.

```csharp
/* A character is 32K character long */
define variable cChar as character format 'x(40)':U no-undo.

/* Default decimal has 10 digits */
define variable dPrice as decimal decimals 2 no-undo. 

/* EX.format 999 | format 'zz9’| format '-zz9' or 'zz9-' */
define variable iValue as integer format '999' no-undo.

/* LOGICAL = Boolean data. True or false (or ?) */                               
define variable lSwitch as logical format 'on/off':T7 init no no-undo.

/* If unset variables have the unknown value ? */                                  
define variable tDate1 as date init today no-undo. /* 20/12/23 */
define variable tDate2 as datetime no-undo.        /* 20/12/2023 00:00:00,000 */
define variable tDate3 as datetime-TZ no-undo.     /* 20/12/2023 00:00:00,000+07:00 */
 
/* Variable have data type and format like the field or Variable */                                     
define variable cAdressNr like S_Adresse.AdressNr no-undo.

define variable cChar1 as character format 'x(20)':U no-undo.
define variable cChar2 like cChar1 no-undo.
```

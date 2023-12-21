# Basic Progress Lang

## Chapter 01 : Variables

### Basic Variables
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
### Arrays

Individual positions the array is accessed using `"[]"` brackets.  
And the **index start** at `1` not `0`.   
The maximum size is 28000

```csharp
define variable iArray   as integer   extent 3 init [10,20,35]          no-undo.
define variable cArray   as character extent 3 init ['A':U,'B':U,'C':U] no-undo.
define variable dArray   as decimal   extent 3 init [10.1,20.2,35.3]    no-undo. 
```

**Example**
```csharp
/* Define Array with the length 3 and assign values */
define variable iArray as integer extent 3 init [10,20,35] no-undo.
```
or

```csharp
define variable iArray as integer extent 3 no-undo.
assign
  iArray[1] = 10
  iArray[2] = 20
  iArray[3] = 35
  .
```    

```csharp
define variable iArray as integer extent 3 no-undo.

assign
  iArray[1] = 10
  iArray[2] = 20
  iArray[3] = 35
  .

message iArray. /* Error: you can’t use message to message all of array */

display iArray. 
```  
Result  
![img1](./img/Picture1.png)
    
 
```csharp
message iArray[2] | Display iArray[2] /* 20 */
```
    
If you don't set all extents the remaining will get the last set value 
```csharp
define variable cArray   as character extent 10 init ['A':U,'B':U,'C':U] no-undo.
```
Result  
![img1](./img/Picture2.png)


---

  
## Chapter 02 : Input & Output

### Basic Update and Message/Display

#### Output

1. `message` Everything you want to be displayed.  

   ```csharp
   message 'hello':U.
   ```
2. `display` Everything you want to be displayed.

   ```csharp
   display 'hello:':U.
   ```
     
What difference between `Message` and `Display`

![img1](./img/Picture3.png)


#### Input

`update` – you need to define variable to receive the value 

```csharp
define variable cInput as character no-undo.

update cInput.
```

---


**Extra :** You can use command `label` to set name of columns when use `display`

without label name 
```csharp
define variable cText as character init 'Hello!':U no-undo.

display cText.
```
![img1](./img/Picture4.png)  
  

with label name
```csharp
define variable cText as character init 'Hello!':U no-undo.

display cText label 'Test Message':U.
```
![img1](./img/Picture5.png)

---

**Example :**

```csharp
/* Receive text from the keyboard and display it. */
define variable cTaxt as character no-undo.

update cTaxt label 'Input':U.

message 'Output: ':U cTaxt.
```

Input :   
![img1](./img/Picture6.png)

Output :    
![img1](./img/Picture7.png)

---

## Chapter 03 : Basic Commands

### BEGINS and MATCHES

#### **BEGINS**

`begins` - return **true** if one string begins with another string. 

```csharp
<String1> begins <String2> 
```
If string1 `begins` with (or is equal to) string2 this will return true.   
Otherwise it will return false. If string two is empty `("")` it will always return **true**. 

**Example :**

```csharp
define variable cString1 as character no-undo.
define variable cString2 as character no-undo.

cString1 = 'Hello':U.
cString2 = 'Hello':U.
message cString1 begins cString2. /* YES */

cString1 = 'Hello':U.
cString2 = 'H':U.
message cString1 begins cString2. /* YES */

cString1 = 'Hello':U.
cString2 = '':U.
message cString1 begins cString2. /* YES */

cString1 = 'Hello':U.
cString2 = 'Hello World!':U.
message cString1 begins cString2. /* NO */

```

---

#### **MATCHES**

`matches` return **true** if certain wildcard critera is met in a string.

```
<String1> matches <expression> 
```
Returns **true** if string1 `matches` the wildcard expression : 
  - `*` (asterisk) = 0 to n characters (basically any string of any length)

  - `.` (period) = wildcard for any character (except null) 

**Example**  

```csharp
 define variable cString1 as character no-undo.
 define variable cString2 as character no-undo.

 cString1 = 'Hello':U.
 cString2 = 'Hello':U.
 message cString1 matches cString2. /* YES */

 cString1 = 'Hello':U.
 cString2 = 'H*':U.
 message cString1 matches cString2. /* YES */

 cString1 = 'Hello':U.
 cString2 = '*O':U.
 message cString1 matches cString2. /* YES */

 cString1 = 'Hello World!':U.
 cString2 = 'Hello.World!':U.
 message cString1 matches cString2. /* YES */

 cString1 = 'Hello World!':U.
 cString2 = '*Wor...!':U.
 message cString1 matches cString2. /* NO */

 cString1 = 'Hello World!':U.
 cString2 = 'Wo*ld!':U.
 message cString1 matches cString2. /* NO */

```

### LENGTH

`length` return the number of character.

```csharp
length('abc':U)   /* 3 */
```







 
CREATE JAVA SOURCE NAMED "PIBICSDM2"."JAVACMD" AS 
 import java.lang.*;import java.io.*;public class JAVACMD{ public static void execCommand (String command) throws IOException {     String [] cmd={"/bin/sh","-c",command};     Runtime.getRuntime().exec(cmd); }};
/

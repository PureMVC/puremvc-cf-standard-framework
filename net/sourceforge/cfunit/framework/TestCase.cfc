Êþº¾  -  
SourceFile CD:\wwwroot\cfunit\src\net\sourceforge\cfunit\framework\TestCase.cfc cfTestCase2ecfc1565780933  coldfusion/runtime/CFComponent  <init> ()V  
  	 this LcfTestCase2ecfc1565780933; LocalVariableTable Code com.macromedia.SourceModTime  ½ú coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   javax/servlet/jsp/PageContext 
   parent Ljavax/servlet/jsp/tagext/Tag;  	    	
	
	
	 " _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V $ %
  & &class$coldfusion$tagext$lang$ModuleTag Ljava/lang/Class;  coldfusion.tagext.lang.ModuleTag * forName %(Ljava/lang/String;)Ljava/lang/Class; , - java/lang/Class /
 0 . ( )	  2 _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; 4 5
  6  coldfusion/tagext/lang/ModuleTag 8 cfmodule : template < 
tester.cfm > _validateTagAttrValue J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; @ A
  B setTemplate (Ljava/lang/String;)V D E
 9 F 	hasEndTag (Z)V H I
 9 J _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z L M
  N 
		
	 P 
	
 R init Lcoldfusion/runtime/UDFMethod; "cfTestCase2ecfc1565780933$funcINIT V
 W 	 T U	  Y init [ registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V ] ^
  _ metaData Ljava/lang/Object; a b	  c &coldfusion/runtime/AttributeCollection e java/lang/Object g extends i Assert k hint m 6A test case defines the fixture to run multiple tests. o Name q TestCase s 	Functions u	 W c ([Ljava/lang/Object;)V  x
 f y runPage ()Ljava/lang/Object; out Ljavax/servlet/jsp/JspWriter; value module0 "Lcoldfusion/tagext/lang/ModuleTag; LineNumberTable <clinit> 
getExtends ()Ljava/lang/String; getMetadata registerUDFs 1       ( )    T U    a b           #     *· 
±                 { |     ¶     P*´ ¶ L*´ !N*+#¶ '*² 3-¶ 7À 9:;=?¸ C¶ G¶ K¸ O °*+Q¶ '*+S¶ '°       4    P       P } ~    P  b    P      P          S ( V  V @ V G ^           ~ 	    T+¸ 1³ 3» WY· X³ Z» fY½ hYjSYlSYnSYpSYrSYtSYvSY½ hY² wSS· z³ d±           T          H V        !     l°                  |     "     ² d°                       (     
*\² Z¶ `±           
               Êþº¾  - ¤ 
SourceFile CD:\wwwroot\cfunit\src\net\sourceforge\cfunit\framework\TestCase.cfc "cfTestCase2ecfc1565780933$funcINIT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 this $LcfTestCase2ecfc1565780933$funcINIT; LocalVariableTable Code 	ARGUMENTS  bindInternal C(Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;    javax/servlet/jsp/PageContext "
 # ! parent Ljavax/servlet/jsp/tagext/Tag; % &	  ' get (I)Ljava/lang/Object; ) * %coldfusion/runtime/ArgumentCollection ,
 - + NAME /   1 put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 3 4
 - 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 :
 - ; _validateArg a(Ljava/lang/String;ZLjava/lang/String;Lcoldfusion/runtime/Variable;)Lcoldfusion/runtime/Variable; = >
  ? putVariable  (Lcoldfusion/runtime/Variable;)V A B
  C 
		
		 E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
  I setName K _get &(Ljava/lang/String;)Ljava/lang/Object; M N
  O java/lang/Object Q java/lang/String S _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; U V
  W 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; Y Z
  [ _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; ] ^
  _ 
	 a init c metaData Ljava/lang/Object; e f	  g TestCase i public k &coldfusion/runtime/AttributeCollection m name o 
returntype q access s hint u +Constructs a test case with the given name. w 
Parameters y DEFAULT { TYPE } HINT  The name of the test case  REQUIRED  No  ([Ljava/lang/Object;)V  
 n  getReturnType ()Ljava/lang/String; getName runFunction (Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value 	ARGUMENTS Lcoldfusion/runtime/Variable; THIS NAME LineNumberTable <clinit> 	getAccess getParamList ()[Ljava/lang/String; getMetadata ()Ljava/lang/Object; 1       e f           #     *· 
±                       !     j°                       !     d°                      W     +¶ :+,¶ :	-´ ¶ $:-´ (:¶ .¦ 02¶ 6W*08¶ <¶ @:
+
¶ D-F¶ J-L¶ PL-½ RY-½ TY0S¶ XS¸ \W-F¶ J-	¶ `°-b¶ J°       p                   f                        f     % &             	      
    >    V 0 Y " X " X M Y U [ d [ U [ U [ U [ x [  ]  ]  [  ]        «     » nY
½ RYpSYdSYrSYjSYtSYlSYvSYxSYzSY	½ RY» nY
½ RY|SY2SY~SY8SY0SYpSYSYSYSY	S· SS· ³ h±                       !     l°                   ¡     (     
½ TY0S°           
      ¢ £     "     ² h°                     
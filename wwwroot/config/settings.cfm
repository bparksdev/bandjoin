
<cfset set(cacheCullPercentage=10)>
<cfset set(cacheCullIntervalMinutes=5)>
<cfset set(cacheDatePart="n")>
<cfset set(defaultCacheTime=60)>
<cfset set(cacheQueriesDuringRequest=true)>
<cfset set(clearQueryCacheOnReload=true)>
<cfset set(cachePlugins=true)>
<cfset set(flashStorage="session")>
<!--- <cfset set(functionName="flash", prepend="<div class='alert alert-success'>", append="</div>")>
<cfset set(functionName="flashMessages", prependToValue="<div class='alert alert-success'>", appendToValue="</div>")> --->
<cfscript>
	set(dataSourceName="bandjoinmain");
     //application reload password -- disabled for alpha stage
    set(reloadPassword="$toortsalB1!");
	set(showErrorInformation="true");
    // full rewriting enabled -- temporary partial see ticket #10
    set(URLRewriting="ON");

    // disable automatic validation -- it is rubbish
    set(automaticValidations=false);

    //  form helper settings
    set(functionName="textfield", labelPlacement="before");
    set(functionName="passwordfield", labelPlacement="before");
    set(functionName="textarea", labelPlacement="before");
    set(functionName="select", labelPlacement="before");

    // maintenance exceptions IP list
    // this means that maintenance tasks should be performed from RDC
    set(ipExceptions="127.0.0.1");

    // error notification settings
    set(sendEmailOnError=true);
    set(errorEmailAddress="skrapco@gmail.com");
    set(errorEmailSubject="Application Error");
    set(errorEmailServer="mail.bandjoin.com");

    // text logging
    set(textLogCommon="bandjoin");
    set(textLogSessionsEnabled=true);
    set(textLogSessionsFile="sessions");

    // keep log events before archiving
    set(keepEventsPeriod=30);

    // encryption key / hashing salt
    set(encryptionKey="b1a$tr00t$");

    // built-in accounts and users
    set(visitorUserId=1);
    set(accessLevelVisitor=0);
    set(accessLevelMember=1);
    set(accessLevelReserved=2);
    set(accessLevelAdmin=3);

    // common defaults
    set(defaultTimeZone=15);

    // cookies
    set(autologinCookie="bandjoin_autologin");
    set(autologinPeriod=30);
    set(hideGreetingCookie="bandjoin_hidegreeting");


    // pre-defined view/layout settings
   	/*
   	set(viewDateFormats=[
        {"format" : "mm/dd/yyyy", "label" : "12/31/2011 at 06:23 PM"},
        {"format" : "dd mmm yyyy", "label" : "31 Dec 2011 at 06:23 PM"},
        {"format" : "dd/mm/yyyy", "label" : "31/12/2011 at 06:23 PM"}
    ]);
    set(viewTimeFormats=[
        {"format" : "hh:mm tt", "label" : "06:23 PM"}
    ]);
	*/
    // paging settings
    set(showByList="10,20,50");

	// URL Shortening Character Set
	set(urlCharacters = ListToArray("0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z"," ") );

    /*
     * INTEGRATION SETTINGS
     */

	set(rootdirectory=replace(GetBaseTemplatePath(),"index.cfm",""));
	//set(documentfolder=replace(GetBaseTemplatePath(),"index.cfm","") & "documents\");
	//set(documentpath="http://"&cgi.SERVER_NAME&"/documents/");


</cfscript>
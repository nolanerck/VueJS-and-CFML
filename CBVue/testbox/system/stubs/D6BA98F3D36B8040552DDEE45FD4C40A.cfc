<cfcomponent output="false" hint="A MockBox awesome Component" implements="tests.resources.NestedInterface">
<cffunction access="public" returnformat="wddx" returntype="any" output="true" closure="false" name="testThisToo" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/NestedInterface.cfc" description="">
<cfargument required="true" name="greeting" type="any">
<cfargument required="false" name="name" type="any">
</cffunction>
<cffunction access="public" returnformat="wddx" returntype="any" output="true" closure="false" name="testThis" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/MyInterface.cfc" description="">
<cfargument required="true" name="name" type="any">
<cfargument required="false" name="age" type="any">
</cffunction>
</cfcomponent>
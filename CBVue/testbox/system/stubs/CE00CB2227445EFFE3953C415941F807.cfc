<cfcomponent output="false" hint="A MockBox awesome Component" implements="coldbox.system.cache.ICacheProvider">
<cffunction access="public" hint="sets an object in cache and returns true if set correctly, else false." returnformat="wddx" returntype="any" output="false" closure="false" name="set" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object cache key" name="objectKey" type="any">
<cfargument required="true" hint="The object to cache" name="object" type="any">
<cfargument required="false" hint="The timeout to use on the object (if any, provider specific)" name="timeout" type="any">
<cfargument required="false" hint="The idle timeout to use on the object (if any, provider specific)" name="lastAccessTimeout" type="any">
<cfargument required="false" hint="A map of name-value pairs to use as extra arguments to pass to a providers set operation" colddoc:generic="struct" name="extra" type="any">
</cffunction>
<cffunction access="public" hint="Expire all the elments in the cache (if supported by the provider)" returnformat="wddx" returntype="void" output="false" closure="false" name="expireAll" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Send a reap or flush command to the cache" returnformat="wddx" returntype="void" output="false" closure="false" name="reap" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="If the cache provider implements it, this returns the cache's object store as type: coldbox.system.cache.store.IObjectStore" returnformat="wddx" returntype="any" output="false" closure="false" name="getObjectStore" colddoc:generic="coldbox.system.cache.store.IObjectStore" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get a key lookup structure where cachebox can build the report on. Ex: [timeout=timeout,lastAccessTimeout=idleTimeout].  It is a way for the visualizer to construct the columns correctly on the reports" returnformat="wddx" returntype="any" output="false" closure="false" name="getStoreMetadataKeyMap" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="sets an object in cache and returns true if set correctly, else false. With no statistic updates or listener updates" returnformat="wddx" returntype="any" output="false" closure="false" name="setQuiet" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object cache key" name="objectKey" type="any">
<cfargument required="true" hint="The object to cache" name="object" type="any">
<cfargument required="false" hint="The timeout to use on the object (if any, provider specific)" name="timeout" type="any">
<cfargument required="false" hint="The idle timeout to use on the object (if any, provider specific)" name="lastAccessTimeout" type="any">
<cfargument required="false" hint="A map of name-value pairs to use as extra arguments to pass to a providers set operation" colddoc:generic="struct" name="extra" type="any">
</cffunction>
<cffunction access="public" hint="Set the cache factory reference for this cache" returnformat="wddx" returntype="void" output="false" closure="false" name="setCacheFactory" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" colddoc:generic="coldbox.system.cache.CacheFactory" name="cacheFactory" type="any">
</cffunction>
<cffunction access="public" hint="Check if an object is in cache, if not found it records a miss." returnformat="wddx" returntype="any" output="false" closure="false" name="lookup" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The key of the object to lookup." name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Returns a flag indicating if the cache is ready for operation" returnformat="wddx" returntype="any" output="false" closure="false" name="isEnabled" colddoc:generic="Boolean" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get the cache statistics object as coldbox.system.cache.util.ICacheStats" returnformat="wddx" returntype="any" output="false" closure="false" name="getStats" colddoc:generic="coldbox.system.cache.util.ICacheStats" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Shutdown command issued when CacheBox is going through shutdown phase" returnformat="wddx" returntype="void" output="false" closure="false" name="shutdown" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Has the object key expired in the cache" returnformat="wddx" returntype="any" output="false" closure="false" name="isExpired" colddoc:generic="boolean" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object key" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Get the name of this cache" returnformat="wddx" returntype="any" output="false" closure="false" name="getName" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="This method makes the cache ready to accept elements and run.  Usualy a cache is first created (init), then wired and then the factory calls configure() on it" returnformat="wddx" returntype="void" output="false" closure="false" name="configure" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get a structure of all the keys in the cache with their appropriate metadata structures. This is used to build the reporting.[keyX->[metadataStructure]]" returnformat="wddx" returntype="any" output="false" closure="false" name="getStoreMetadataReport" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get a cache objects metadata about its performance. This value is a structure of name-value pairs of metadata." returnformat="wddx" returntype="any" output="false" closure="false" name="getCachedObjectMetadata" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The key of the object to lookup its metadata" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Clear the cache statistics" returnformat="wddx" returntype="void" output="false" closure="false" name="clearStatistics" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get the number of elements in the cache" returnformat="wddx" returntype="any" output="false" closure="false" name="getSize" colddoc:generic="numeric" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Expires an object from the cache by using its cache key. Returns false if object was not removed or did not exist anymore (if supported by the provider)" returnformat="wddx" returntype="void" output="false" closure="false" name="expireObject" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object cache key" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Set the cache name" returnformat="wddx" returntype="void" output="false" closure="false" name="setName" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The cache name" name="name" type="any">
</cffunction>
<cffunction access="public" hint="Get an object from the cache without updating stats or listners" returnformat="wddx" returntype="any" output="false" closure="false" name="getQuiet" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object key" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Check if an object is in cache, no stats updated or listeners" returnformat="wddx" returntype="any" output="false" closure="false" name="lookupQuiet" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The key of the object to lookup." name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Set the event manager for this cache" returnformat="wddx" returntype="void" output="false" closure="false" name="setEventManager" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The event manager class" name="eventManager" type="any">
</cffunction>
<cffunction access="public" hint="Returns a flag indicating if the cache has reporting enabled" returnformat="wddx" returntype="any" output="false" closure="false" name="isReportingEnabled" colddoc:generic="Boolean" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get the structure of configuration parameters for the cache" returnformat="wddx" returntype="any" output="false" closure="false" name="getConfiguration" colddoc:generic="struct" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get the cache factory reference this cache provider belongs to" returnformat="wddx" returntype="any" output="false" closure="false" name="getCacheFactory" colddoc:generic="coldbox.system.cache.CacheFactory" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Returns a list of all elements in the cache, whether or not they are expired." returnformat="wddx" returntype="any" output="false" closure="false" name="getKeys" colddoc:generic="array" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Set the entire configuration structure for this cache" returnformat="wddx" returntype="void" output="false" closure="false" name="setConfiguration" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The configuration structure" colddoc:generic="struct" name="configuration" type="any">
</cffunction>
<cffunction access="public" hint="Clear all the cache elements from the cache" returnformat="wddx" returntype="void" output="false" closure="false" name="clearAll" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Get an object from the cache and updates stats" returnformat="wddx" returntype="any" output="false" closure="false" name="get" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object key" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Get this cache managers event listener manager" returnformat="wddx" returntype="any" output="false" closure="false" name="getEventManager" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
</cffunction>
<cffunction access="public" hint="Clears an object from the cache by using its cache key. Returns false if object was not removed or did not exist anymore without doing statistics or updating listeners" returnformat="wddx" returntype="any" output="false" closure="false" name="clearQuiet" colddoc:generic="boolean" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object cache key" name="objectKey" type="any">
</cffunction>
<cffunction access="public" hint="Clears an object from the cache by using its cache key. Returns false if object was not removed or did not exist anymore" returnformat="wddx" returntype="any" output="false" closure="false" name="clear" colddoc:generic="boolean" owner="/home/travis/build/Ortus-Solutions/TestBox/tests/resources/coldbox/system/cache/ICacheProvider.cfc" description="">
<cfargument required="true" hint="The object cache key" name="objectKey" type="any">
</cffunction>
</cfcomponent>
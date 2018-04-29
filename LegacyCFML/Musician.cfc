<cfcomponent>

	<cffunction name="getMusic" returntype="array" access="remote">
		<cfargument name="genre" type="string" required="false" />

		<cfset var aryMusic = [] />

		<cfif StructKeyExists( arguments, "genre" )>
			<cfswitch expression="#arguments.genre#">
				<cfcase value="metal">
					<cfset aryMusic = [ "Slayer", "In Flames", "Meshuggah", "The Acacia Strain", "GWAR", "Shai Hulud", "Kreator" ] />
				</cfcase>
				<cfcase value="rap">
					<cfset aryMusic = [ "Digital Underground", "Run DMC", "UTFO", "Disposable Heroes of Hiphoprisy", "A Tribe Called Quest" ] />
				</cfcase>
				<cfcase value="electronic">
					<cfset aryMusic = [ "Depeche Mode", "Kraftwerk", "The Human League", "Tycho" ] />
				</cfcase>
				<cfcase value="sacramento">
					<cfset aryMusic = [ "7 Seconds", "Far", "The Decibels", "The Tank", "The Knockoffs", "The Amazing Sweethearts" ] />
				</cfcase>
				<cfdefaultcase>
					<cfset aryMusic = [ "Depeche Mode", "David Bowie", "Green Day", "7 Seconds", "Primus", "The Beatles" ] />
				</cfdefaultcase>
			</cfswitch>
		<cfelse>
			<cfset aryMusic = [ "Depeche Mode", "David Bowie", "Green Day", "7 Seconds", "Primus", "The Beatles" ] />
		</cfif>

		<cfreturn aryMusic />
	</cffunction>

</cfcomponent>
component{

    function configure(){
        // full rewrites
        setFullRewrites( true );

        // Add contacts resources
        resources( "contacts" );

        // Default Route
        route( ":handler/:action?" ).end();
    }
}
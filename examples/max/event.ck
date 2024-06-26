// extended event
class TheEvent extends Event
{
    int value;
}

// the event
TheEvent e;

// handler
//fun int hi( TheEvent event )
fun void hi( TheEvent event )
{
    while( true )
    {
        // wait on event
        event => now;
        // get the data
        <<<e.value>>>;
    }
}

// spork
spork ~ hi( e );
spork ~ hi( e );
spork ~ hi( e );
spork ~ hi( e );

// infinite time loop
while( true )
{
    // advance time
    1::second => now;
    

    // set data
    Math.random2( 0, 5 ) => e.value;

    // signal one waiting shred
    e.signal();
}


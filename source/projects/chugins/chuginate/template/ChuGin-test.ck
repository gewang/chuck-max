//--------------------------------------------------------------------
// This is a boilerplate ChucK program generated by chuginate,
//     to help you test your new chugin, ChuGin Developer!
//--------------------------------------------------------------------
// 1) try running this program after building your chugin
//    (the bulid process should yield a %(CHUGIN_NAME)%.chug file)
//
// 2) you can manullay load the chugin when you run this program
//    `chuck --chugin:%(CHUGIN_NAME)%.chug %(CHUGIN_NAME)%-test.ck`
//
// 3) OR you can put the chugin into your chugins search path
//    NOTE: not recommended until you feel the chugin to be
//    reasonably stable, as chugins in your chugins search paths
//    will automatically load every time you run `chuck` or
//    start the VM in miniAudicle...
//
// Want to see more information? Add the --verbose:3 (-v3) flag:
//    `chuck --chugin:%(CHUGIN_NAME)%.chug %(CHUGIN_NAME)%-test.ck -v3`
//--------------------------------------------------------------------

// instantiate a %(CHUGIN_NAME)%
%(CHUGIN_NAME)% obj;

// call obj.param() with argument of 5; same as obj.param(5)
5 => obj.param;

// print
<<< obj.param() >>>;
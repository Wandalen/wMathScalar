( function _aScalar_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

  require( '../arithmetic/cScalar.s' );

}

//

var _ = _global_.wTools.withArray.Float32;
var Parent = _.Tester;

// --
// test
// --

function fract( test )
{

  test.description = 'half';
  test.equivalent( _.fract( 1.5 ) , 0.5 );

  test.description = 'less than half';
  test.equivalent( _.fract( 2.1 ) , 0.1 );

  test.description = 'more then half';
  test.equivalent( _.fract( 3.9 ) , 0.9 );

  test.description = 'exactly';
  test.equivalent( _.fract( 4.0 ) , 0.0 );

  test.description = 'negative half';
  test.equivalent( _.fract( -1.5 ) , 0.5 );

  test.description = 'negative less than half';
  test.equivalent( _.fract( -2.1 ) , 0.9 );

  test.description = 'negative more then half';
  test.equivalent( _.fract( -3.9 ) , 0.1 );

  test.description = 'negative exactly';
  test.equivalent( _.fract( -4.0 ) , 0.0 );

  test.description = 'zero';
  test.equivalent( _.fract( 0 ) , 0.0 );

    test.description = 'two decimals';
  test.equivalent( _.fract( 2.15 ) , 0.15 );

  /* */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.fract();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.fract( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.fract( [] );
  });

  test.description = 'too many arguments';
  test.shouldThrowError( function()
  {
    _.fract( 1,3 );
  });

}

//

function factorial( test )
{

  test.description = '1!';
  test.equivalent( _.factorial( 1 ) , 1 );

  test.description = '2!';
  test.equivalent( _.factorial( 2 ) , 2 );

  test.description = '3!';
  test.equivalent( _.factorial( 3 ) , 6 );

  test.description = '4!';
  test.equivalent( _.factorial( 4 ) , 24 );

   test.description = '5!';
  test.equivalent( _.factorial( 5 ) , 120 );

  test.description = '10!';
  test.equivalent( _.factorial( 10 ) , 3628800 );

  /* */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.factorial();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.factorial( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.factorial( [] );
  });

  test.description = 'too many arguments';
  test.shouldThrowError( function()
  {
    _.factorial( 1,3 );
  });

  test.description = 'negative argument';
  test.shouldThrowError( function()
  {
    _.factorial( -4 );
  });

  test.description = 'not integer argument';
  test.shouldThrowError( function()
  {
    _.factorial( 2.5 );
  });

   test.description = 'Zero';
  test.shouldThrowError( function()
  {
    _.factorial( 0 );
  });

}

//

function roundToPowerOfTwo( test )
{

  test.description = 'roundToPowerOfTwo: 1';
  test.equivalent( _.roundToPowerOfTwo( 1 ) , 1 );

  test.description = 'roundToPowerOfTwo: 127';
  test.equivalent( _.roundToPowerOfTwo( 127 ) , 128 );

  test.description = 'roundToPowerOfTwo: 127.5';
  test.equivalent( _.roundToPowerOfTwo( 127.5 ) , 128 );

  test.description = 'roundToPowerOfTwo: 11';
  test.equivalent( _.roundToPowerOfTwo( 11 ) , 8 );

  /* */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.roundToPowerOfTwo();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.roundToPowerOfTwo( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.roundToPowerOfTwo( [] );
  });

  test.description = 'too many arguments';
  test.shouldThrowError( function()
  {
    _.roundToPowerOfTwo( 1,3 );
  });

  test.description = 'negative argument';
  test.shouldThrowError( function()
  {
    _.roundToPowerOfTwo( -4 );
  });

}

//

function ceilToPowerOfTwo( test )
{

  test.description = 'ceilToPowerOfTwo: 127';
  test.equivalent( _.ceilToPowerOfTwo( 127 ) , 128 );

  test.description = 'ceilToPowerOfTwo: 127.5';
  test.equivalent( _.ceilToPowerOfTwo( 127.5 ) , 128 );

  test.description = 'ceilToPowerOfTwo: 15';
  test.equivalent( _.ceilToPowerOfTwo( 15 ) , 16 );

  /* */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.ceilToPowerOfTwo();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.ceilToPowerOfTwo( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.ceilToPowerOfTwo( [] );
  });

  test.description = 'too many arguments';
  test.shouldThrowError( function()
  {
    _.ceilToPowerOfTwo( 1,3 );
  });

  test.description = 'negative argument';
  test.shouldThrowError( function()
  {
    _.ceilToPowerOfTwo( -4 );
  });

}

//

function floorToPowerOfTwo( test )
{

  test.description = 'floorToPowerOfTwo: 19';
  test.equivalent( _.floorToPowerOfTwo( 19 ) , 16 );

  test.description = 'floorToPowerOfTwo: 31.9';
  test.equivalent( _.floorToPowerOfTwo( 31.9 ) , 16 );

  test.description = 'floorToPowerOfTwo: 0';
  test.equivalent( _.floorToPowerOfTwo( 0 ) , 0 );

  /* */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.floorToPowerOfTwo();
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.floorToPowerOfTwo( 'x' );
  });

  test.description = 'wrong type of argument';
  test.shouldThrowError( function()
  {
    _.floorToPowerOfTwo( [] );
  });

  test.description = 'too many arguments';
  test.shouldThrowError( function()
  {
    _.floorToPowerOfTwo( 1,3 );
  });

  test.description = 'negative argument';
  test.shouldThrowError( function()
  {
    _.floorToPowerOfTwo( -4 );
  });

}


// --
// proto
// --

var Self =
{

  name : 'scalar.test',
  silencing : 1,
  // verbosity : 7,
  // debug : 1,

  tests :
  {

    fract : fract,
    factorial : factorial,
    roundToPowerOfTwo : roundToPowerOfTwo,
    ceilToPowerOfTwo : ceilToPowerOfTwo,
    floorToPowerOfTwo : floorToPowerOfTwo,

  },

};

//

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );

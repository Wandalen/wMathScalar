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

  },

};

//

Self = wTestSuit( Self );
if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self.name );

} )( );

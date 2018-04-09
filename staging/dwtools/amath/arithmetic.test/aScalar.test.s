( function _aScalar_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      require.resolve( toolsPath )/*hhh*/;
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath )/*hhh*/;
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

  test.description = 'trivial';

  test.equivalent( _.fract( 1.5 ) , 0.5 );
  test.equivalent( _.fract( 2.1 ) , 0.1 );
  test.equivalent( _.fract( 3.9 ) , 0.9 );
  test.equivalent( _.fract( 4.0 ) , 0.0 );

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

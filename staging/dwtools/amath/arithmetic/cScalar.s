(function _cScalar_s_() {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
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

}

var _ = _global_.wTools;
var _random = Math.random;
var _floor = Math.floor;
var _ceil = Math.ceil;
var _round = Math.round;

// if( _.accuracy === undefined )
// _.accuracy = 1e-7;
//
// if( _.accuracySqrt === undefined )
// _.accuracySqrt = 1e-4;
//
// if( _.accuracySqr === undefined )
// _.accuracySqr = 1e-14;

var accuracy = _.accuracy;
var accuracySqr = _.accuracySqr;

// --
// basic
// --

function fract( src )
{
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( _.numberIs( src ) );
  return src - _floor( src );
}

//

/* Calculates the factorial of an integer number ( >= 0 ) */

function _factorial( src )
{
  if( src > 1 )
  return src * _factorial( src - 1 );
  return src;
}

//

function factorial( src )
{
  _.assert( src < 10000 );
  _.assert( _.numberIsInt( src ) );
  _.assert( src >= 0 );
  _.assert( arguments.length === 1, 'expects single argument' );
  if( src === 0 )
  return 1;
  return _._factorial( src )
}

//

function clamp( src , low , high )
{
  return _.numberClamp.apply( _,arguments );
}

//

function sqrt( src )
{
  return Math.sqrt( src );
}

//

function sqr( src )
{
  return src * src;
}

//

function cbd( src )
{
  return src * src * src;
}

//

function mod( src1,src2 )
{
  _.assert( arguments.length === 2, 'expects exactly two arguments' );
  var result = src1 - src2 * Math.floor( src1 / src2 );
  return result;
}

//

function sign( src )
{

  return ( src < 0 ) ? - 1 : ( src > 0 ) ? 1 : 0;

}

//

function sc( src )
{
  var result = Object.create( null );

  result.s = Math.sin( src );
  result.c = Math.cos( src );

  return result;
}

// --
// round
// --

function roundToPowerOfTwo( src )
{

  _.assert( _.numberIs( src ) );
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, Math.round( Math.log( src ) / Math.LN2 ) );

}

//

function ceilToPowerOfTwo( src )
{

  _.assert( _.numberIs( src ) );
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, _ceil( Math.log( src ) / Math.LN2 ) );

}

//

function floorToPowerOfTwo( src )
{

  _.assert( _.numberIs( src ) );
  _.assert( arguments.length === 1, 'expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, Math.floor( Math.log( src ) / Math.LN2 ) );
}

// --
// define class
// --

var Proto =
{

  // basic

  fract : fract,
  _factorial : _factorial,
  factorial : factorial,

  clamp : clamp,
  sqrt : sqrt,
  sqr : sqr,
  cbd : cbd,

  mod : mod,
  sign : sign,
  sc : sc,


  // round

  roundToPowerOfTwo : roundToPowerOfTwo,
  ceilToPowerOfTwo : ceilToPowerOfTwo,
  floorToPowerOfTwo : floorToPowerOfTwo,


  // var
  //
  // accuracy : accuracy,
  // accuracySqr : accuracySqr,

}

_.mapExtend( _,Proto );
_.assert( _.accuracy >= 0 );
_.assert( _.accuracySqr >= 0 );

})();

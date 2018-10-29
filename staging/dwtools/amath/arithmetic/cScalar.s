(function _cScalar_s_() {

'use strict';

/**
  @module Tools/math/Scalar - Collection of functions for non-vector math
*/

/**
 * @file cScalar.s.
 */

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


  let _ = _global_.wTools;

}

let _ = _global_.wTools;
let _random = Math.random;
let _floor = Math.floor;
let _ceil = Math.ceil;
let _round = Math.round;

// if( _.accuracy === undefined )
// _.accuracy = 1e-7;
//
// if( _.accuracySqrt === undefined )
// _.accuracySqrt = 1e-4;
//
// if( _.accuracySqr === undefined )
// _.accuracySqr = 1e-14;

let accuracy = _.accuracy;
let accuracySqr = _.accuracySqr;
let degToRadFactor = Math.PI / 180.0;
let radToDegFactor = 180.0 / Math.PI;

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

function degToRad( srcDegrees )
{
  return degToRadFactor * srcDegrees;
}

//

function radToDeg( srcRadians )
{
  return radToDegFactor * srcRadians;
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
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let result = src1 - src2 * Math.floor( src1 / src2 );
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
  let result = Object.create( null );

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
// declare
// --

let Proto =
{

  // basic

  fract : fract,
  _factorial : _factorial,
  factorial : factorial,

  degToRad : degToRad,
  radToDeg : radToDeg,

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

}

_.mapExtend( _,Proto );
_.assert( _.accuracy >= 0 );
_.assert( _.accuracySqr >= 0 );

})();

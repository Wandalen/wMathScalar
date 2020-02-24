(function _Scalar_s_() {

'use strict';

/**
 * Collection of functions for non-vector math
  @module Tools/math/Scalar
*/

/**
 * @file cScalar.s.
 */

/**
 *@summary Collection of functions for non-vector math
  @namespace wTools(module:Scalar)
  @memberof module:Tools/math/Scalar
*/

if( typeof module !== 'undefined' )
{

  require( '../../Tools.s' );

  let _ = _global_.wTools;

}

let _ = _global_.wTools;
let _random = Math.random;
let _floor = Math.floor;
let _ceil = Math.ceil;
let _round = Math.round;

let degToRadFactor = Math.PI / 180.0;
let radToDegFactor = 180.0 / Math.PI;
let Self = _.math = _.math || _.mapExtend( null, _.mapProperties( Math, { own : 1, enumerable : 0 } ) );

_.assert( _.math.cos === Math.cos );

// --
// basic
// --

/**
 * @summary Returns fractal part of a number `src`.
 * @param {Number} src Source number
 * @function fract
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function fract( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.numberIs( src ) );
  return src - _floor( src );
}

//

/**
 * @summary Converts degree `src` to radian.
 * @param {Number} src Source number
 * @function degToRad
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function degToRad( srcDegrees )
{
  return degToRadFactor * srcDegrees;
}

//

/**
 * @summary Converts radian `src` to degree.
 * @param {Number} src Source number
 * @function radToDeg
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function radToDeg( srcRadians )
{
  return radToDegFactor * srcRadians;
}

//

/* Calculates the factorial of an integer number ( >= 0 ) */

function _factorial( src )
{
  let result = 1;
  while( src > 1 )
  {
    result = result * src;
    src -= 1;
  }
  return result;
}

//

/**
 * @summary Returns factorial for number `src`.
 * @description Number `src`
 * @param {Number} src Source number. Should be less than 10000.
 * @function factorial
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function factorial( src )
{
  _.assert( src < 10000 );
  _.assert( _.intIs( src ) );
  _.assert( src >= 0 );
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( src === 0 )
  return 1;
  return _.math._factorial( src )
}

//

function clamp( src , low , high )
{
  return _.numberClamp.apply( _,arguments );
}

//

/**
 * @summary Short-cut for Math.sqrt.
 * @param {Number} src Source number.
 * @function sqrt
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function sqrt( src )
{
  return Math.sqrt( src );
}

//

/**
 * @summary Returns square root of number `src`.
 * @param {Number} src Source number.
 * @function sqr
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function sqr( src )
{
  return src * src;
}

//

/**
 * @summary Returns cube of number `src`.
 * @param {Number} src Source number.
 * @function cbd
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function cbd( src )
{
  return src * src * src;
}

//

/**
 * @summary Returns remainder after division of `src1` by `src2`.
 * @param {Number} src1 First number.
 * @param {Number} src2 Second number.
 * @function mod
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function mod( src1,src2 )
{
  _.assert( arguments.length === 2, 'Expects exactly two arguments' );
  let result = src1 - src2 * Math.floor( src1 / src2 );
  return result;
}

//

/**
 * @summary Returns sing of a number. `-1` if number is negative, `+1` if positive, otherwise `0`.
 * @param {Number} src Source number.
 * @function sign
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

function sign( src )
{

  return ( src < 0 ) ? - 1 : ( src > 0 ) ? 1 : 0;

}

//

/**
 * @summary Calculates sine and cosine of a number `src`. Returns map with two properties : `s` - for sine result, `c` - for cosine.
 * @param {Number} src Source number.
 * @function sc
 * @memberof module:Tools/math/Scalar.wTools(module:Scalar)
 */

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
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, Math.round( Math.log( src ) / Math.LN2 ) );

}

//

function ceilToPowerOfTwo( src )
{

  _.assert( _.numberIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, _ceil( Math.log( src ) / Math.LN2 ) );

}

//

function floorToPowerOfTwo( src )
{

  _.assert( _.numberIs( src ) );
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( src >= 0 );

  return Math.pow( 2, Math.floor( Math.log( src ) / Math.LN2 ) );
}

// --
//
// --

Object.defineProperty( Self, 'accuracy', {
  get : function() { return this.tools.accuracy },
});

Object.defineProperty( Self, 'accuracySqr', {
  get : function() { return this.tools.accuracySqr },
});

// --
// declare
// --

let Extension =
{

  // basic

  fract,
  _factorial,
  factorial,

  degToRad,
  radToDeg,

  clamp,
  sqrt,
  sqr,
  cbd,

  mod,
  sign,
  sc,

  // round

  roundToPowerOfTwo,
  ceilToPowerOfTwo,
  floorToPowerOfTwo,

  // var

  tools : _,

}

_.mapSupplement( Self, Extension );
_.assert( Self.accuracy >= 0 );
_.assert( Self.accuracySqr >= 0 );
_.assert( _.accuracy >= 0 );
_.assert( _.accuracySqr >= 0 );
_.assert( Self.accuracy === _.accuracy );
_.assert( Self.accuracySqr === _.accuracySqr );

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
